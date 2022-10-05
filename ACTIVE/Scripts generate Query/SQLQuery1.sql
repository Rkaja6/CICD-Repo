----all sql agent jobs histic run logs

WITH CTE_NORMALIZE_DATETIME_DATA
AS (
   SELECT sysjobhistory.instance_id AS job_run_instance_id,
          sysjobhistory.job_id AS job_id,
          sysjobhistory.step_id AS Step_id,
          sysjobhistory.step_name AS Step_name,
          CAST(sysjobhistory.run_date AS VARCHAR(MAX)) AS Run_Date_VARCHAR,
          REPLICATE('0', 6 - LEN(CAST(sysjobhistory.run_time AS VARCHAR(MAX))))
          + CAST(sysjobhistory.run_time AS VARCHAR(MAX)) AS Run_Time_VARCHAR,
          REPLICATE('0', 6 - LEN(CAST(sysjobhistory.run_duration AS VARCHAR(MAX))))
          + CAST(sysjobhistory.run_duration AS VARCHAR(MAX)) AS Run_Duration_VARCHAR,
          sysjobhistory.run_status AS Run_Status
   FROM msdb.dbo.sysjobhistory
   WHERE run_date >= CONVERT(NCHAR(8), GETDATE() - 31, 112))
   
   
   SELECT @@SERVERNAME AS ServerName,
           CAST('msdb' AS NVARCHAR(128)) AS DatabaseName,
           C.job_run_instance_id,
           C.job_id,
           J.name Job_name,
           
                   category_id as job_category_id,
           C.Step_id,
           C.Step_name,
           CAST(SUBSTRING(C.Run_Date_VARCHAR, 5, 2) + '/' + SUBSTRING(C.Run_Date_VARCHAR, 7, 2) + '/'
                + SUBSTRING(C.Run_Date_VARCHAR, 1, 4) AS DATETIME)
           + CAST(STUFF(STUFF(C.Run_Time_VARCHAR, 5, 0, ':'), 3, 0, ':') AS DATETIME) AS job_start_datetime,
           CAST(SUBSTRING(C.Run_Duration_VARCHAR, 1, 2) AS INT) * 3600
           + CAST(SUBSTRING(C.Run_Duration_VARCHAR, 3, 2) AS INT) * 60
           + CAST(SUBSTRING(C.Run_Duration_VARCHAR, 5, 2) AS INT) AS job_duration_seconds,
           CASE C.Run_Status
               WHEN 0 THEN
                   'Failure'
               WHEN 1 THEN
                   'Success'
               WHEN 2 THEN
                   'Retry'
               WHEN 3 THEN
                   'Canceled'
               ELSE
                   'Unknown'
           END AS job_status
    FROM CTE_NORMALIZE_DATETIME_DATA C
        JOIN msdb.dbo.sysjobs J
            ON J.job_id = C.job_id

---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--------all job folder in the jobs------------
    Select Distinct
    fold.[name] as Folder_name
    ,proj.[name] as Project_Name
    ,pack.[name] as Package_Name
	,CASE execs.[status] 
		WHEN 1 THEN 'created' 
		WHEN 2 THEN 'running' 
		WHEN 3 THEN 'canceled' 
		WHEN 4 THEN 'failed' 
		WHEN 5 THEN 'pending' 
		WHEN 6 THEN 'ended unexpectedly' 
		WHEN 7 THEN 'succeeded' 
		WHEN 8 THEN 'stopping' 
		WHEN 9 THEN 'completed' END AS StatusDesc 
    ,ops.[message_time]
    ,mess.[message_source_name]
    ,ops.[message]
    --,mess.[execution_path]        -- this is pretty long path if you are pasting into an email or Excel
From SSISDB.[catalog].[projects] proj
    Join SSISDB.[catalog].[packages] pack on proj.project_id = pack.project_id
    Join SSISDB.[catalog].[folders] fold on fold.folder_id = proj.folder_id
    Join SSISDB.[catalog].[executions] execs on 
        execs.folder_name = fold.[name] and
        execs.project_name = proj.[name] and 
        execs.package_name = pack.[name]
    Join SSISDB.[catalog].[operation_messages] ops on execs.execution_id = ops.operation_id
    join SSISDB.[catalog].[event_messages] mess on ops.[operation_id] = mess.[operation_id]
        and mess.event_message_id = ops.operation_message_id
        and    mess.package_name = pack.[name]
Where 1=1
 --and execs.[status] <>7
   and ops.message_type = 120          -- errors only
    --and mess.message_type in (120,130)  -- errors and warnings
   and ops.message_time > getdate() - 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------Weekly  Job Run Report Query-------------------------------------------------------------- 
CREATE FUNCTION dbo.DaysOfWeekDecoder (@Freq_Interval INT) RETURNS VARCHAR(100)
AS
BEGIN
DECLARE @RetVal VARCHAR(100);
IF @Freq_Interval &  1 =  1 SET @RetVal = 'Sunday';
IF @Freq_Interval &  2 =  2 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Monday';
IF @Freq_Interval &  4 =  4 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Tuesday';
IF @Freq_Interval &  8 =  8 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Wednesday';
IF @Freq_Interval & 16 = 16 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Thursday';
IF @Freq_Interval & 32 = 32 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Friday';
IF @Freq_Interval & 64 = 64 SET @RetVal = CASE WHEN @RetVal IS NULL THEN '' ELSE @RetVal + ', ' END + 'Saturday';
RETURN @RetVal;                 
END

drop table if exists #temp,#schedules

;WITH CTE1 AS (
    SELECT 
        J.job_id
        ,JobName = J.name
        ,JS.step_id, JS.step_name, JS.command
        ,StartIndex = 
            CASE 
                WHEN JS.command LIKE '/DTS%' OR JS.command LIKE '/SQL%' OR JS.command LIKE '/ISSERVER%' THEN CHARINDEX('\',JS.command, CHARINDEX('\',JS.command) + 1) --'
                WHEN JS.command LIKE '/SERVER%' THEN CHARINDEX('"', JS.Command, CHARINDEX(' ',command, CHARINDEX(' ',command) + 1) + 1) + 1
                ELSE 0
            END
        ,EndIndex = 
            CASE 
                WHEN JS.command LIKE '/DTS%' OR JS.command LIKE '/SQL%'  OR JS.command LIKE '/ISSERVER%' 
                    THEN  CHARINDEX('"',JS.command, CHARINDEX('\',JS.command, CHARINDEX('\',JS.command) + 1)) --'
                        - CHARINDEX('\',JS.command, CHARINDEX('\',JS.command) + 1) - 1 --'
                WHEN JS.command LIKE '/SERVER%' 
                    THEN  CHARINDEX('"',command, CHARINDEX('"', JS.Command, CHARINDEX(' ',command, CHARINDEX(' ',command) + 1) + 1) + 1)
                        - CHARINDEX('"', JS.Command, CHARINDEX(' ',command, CHARINDEX(' ',command) + 1) + 1) - 1
                ELSE 0
            END
    FROM msdb.dbo.sysjobsteps JS
    INNER JOIN msdb.dbo.sysjobs J
        ON JS.job_id = J.job_id
    WHERE JS.subsystem = 'SSIS' and j.enabled=1
)    
SELECT 
    C1.job_id
    , C1.JobName
    , C1.step_id
    , C1.step_name
    , PackageFolderPath = 
        CASE 
            WHEN C1.command LIKE '/DTS%' OR C1.command LIKE '/ISSERVER%' THEN SUBSTRING(C1.command, C1.StartIndex, C1.EndIndex)
            WHEN C1.command LIKE '/SQL%' THEN '\MSDB' + SUBSTRING(C1.command, C1.StartIndex, C1.EndIndex)
            WHEN C1.command LIKE '/SERVER%' THEN '\MSDB\' + SUBSTRING(C1.command, C1.StartIndex, C1.EndIndex)
            ELSE NULL
        END
    , C1.command  into #temp 
FROM CTE1 C1
ORDER BY C1.job_id, C1.step_id



SELECT 
  
  schedule_id
, name
, enabled
, CASE freq_type
    WHEN 1   THEN 'One time only'
    WHEN 4   THEN 'Daily'
    WHEN 8   THEN 'Weekly'
    WHEN 16  THEN 'Monthly'
    WHEN 32  THEN 'Monthly'
    WHEN 64  THEN 'Runs when the SQL Server Agent service starts'
    WHEN 128 THEN 'Runs when the computer is idle'
  END AS FrequencyType
, CASE WHEN freq_type = 32 AND freq_relative_interval <> 0 THEN 
    CASE freq_relative_interval 
      WHEN 1  THEN 'First'
      WHEN 2  THEN 'Second'
      WHEN 4  THEN 'Third'
      WHEN 8  THEN 'Fourth'
      WHEN 16 THEN 'Last'
    END
    ELSE 'UNUSED' 
  END Interval
, CASE  freq_type
    WHEN 1   THEN 'UNUSED'
    WHEN 4   THEN 'Every ' + CAST(freq_interval AS VARCHAR(3)) + ' Day(s)'
    WHEN 8   THEN dbo.DaysOfWeekDecoder(freq_interval)
    WHEN 16  THEN 'On day ' + CAST(freq_interval AS VARCHAR(3)) + ' of the month.'
    WHEN 32  THEN CASE freq_interval
                    WHEN 1  THEN 'Sunday'
                    WHEN 2  THEN 'Monday'
                    WHEN 3  THEN 'Tuesday'
                    WHEN 4  THEN 'Wednesday'
                    WHEN 5  THEN 'Thursday'
                    WHEN 6  THEN 'Friday'
                    WHEN 7  THEN 'Saturday'
                    WHEN 8  THEN 'Day'
                    WHEN 9  THEN 'Weekday'
                    WHEN 10 THEN 'Weekend day'
                  END
    WHEN 64  THEN 'UNUSED'
    WHEN 128 THEN 'UNUSED'
  END as freq_type
, CASE WHEN freq_subday_interval <> 0 THEN 
    CASE freq_subday_type
      WHEN 1 THEN 'At ' + CAST(freq_subday_interval AS VARCHAR(3))
      WHEN 2 THEN 'Repeat every ' + CAST(freq_subday_interval  AS VARCHAR(3)) + ' Seconds'
      WHEN 4 THEN 'Repeat every ' + CAST(freq_subday_interval  AS VARCHAR(3)) + ' Minutes'
      WHEN 8 THEN 'Repeat every ' + CAST(freq_subday_interval  AS VARCHAR(3)) + ' Hours'
    END 
    ELSE 'UNUSED'
  END DailyFrequency
, CASE 
    WHEN freq_type = 8 THEN 'Repeat every ' + CAST(freq_recurrence_factor AS VARCHAR(3)) + ' week(s).'
    WHEN freq_type IN (16,32)      THEN 'Repeat every ' + CAST(freq_recurrence_factor AS VARCHAR(3)) + ' month(s).'
    ELSE 'UNUSED'
  END Interval2
, STUFF(STUFF(RIGHT('00000' + CAST(active_start_time AS VARCHAR(6)),6),3,0,':'),6,0,':')StartTime
, STUFF(STUFF(RIGHT('00000' + CAST(active_end_time AS VARCHAR(6)),6),3,0,':'),6,0,':') EndTime
into #schedules
FROM msdb.dbo.sysschedules
where enabled=1



--jobs and its schedule 
 select *
 from #temp t 
  JOIN (SELECT distinct schedule_id, job_id FROM msdb.dbo.sysjobschedules) a on a.job_id=t.job_id
 join #schedules s on a.schedule_id=s.schedule_id
