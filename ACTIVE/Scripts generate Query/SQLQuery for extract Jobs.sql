SELECT
sj.job_id as 'JOB ID'
  ,sj.name JobName
, sj.enabled
, sjs.step_id
, sjs.step_name
, sjs.subsystem as 'Type'
, sjs.command
,sjs.database_name as 'DataBase Name'
,sjs.last_run_date as'Last Run Date'
,sjs.last_run_duration as 'Last Run Time Duration  '
, CASE on_success_action
    WHEN 1 THEN 'Quit with success'
    WHEN 2 THEN 'Quit with failure'
    WHEN 3 THEN 'Go to next step'
    WHEN 4 THEN 'Go to step ' + CAST(on_success_step_id AS VARCHAR(3))
  END On_Success

FROM msdb.dbo.sysjobs sj
  INNER JOIN msdb.dbo.sysjobsteps sjs ON sj.job_id = sjs.job_id
--WHERE sj.name = 'MSSQLTips Demo Job'




--SELECT 
--  sj.name JobName
--, sjh.step_id
--, ISNULL(sjs.step_name, 'Job Status') StepName
--, msdb.dbo.agent_datetime(sjh.run_date, sjh.run_time) RunDateAndTime
--, STUFF(STUFF(RIGHT('00000' + CAST(run_duration AS VARCHAR(6)),6),3,0,':'),6,0,':') 
--, CASE sjh.run_status
--    WHEN 0 THEN 'Failed'
--    WHEN 1 THEN 'Succeeded'
--    WHEN 2 THEN 'Retry'
--    WHEN 3 THEN 'Canceled'
--    WHEN 4 THEN 'In Progress'
--  END RunStatus
--, sjh.message
--FROM msdb.dbo.sysjobs sj
--  INNER JOIN msdb.dbo.sysjobhistory sjh ON sj.job_id = sjh.job_id
--  LEFT OUTER JOIN msdb.dbo.sysjobsteps sjs ON sjh.job_id = sjs.job_id AND sjh.step_id = sjs.step_id  
-----WHERE sj.name = 'MSSQLTips Demo Job'



--SELECT 
--  sj.name JobName
--, sjs.step_id
--, sjs.step_name
--, sjsl.log
--FROM msdb.dbo.sysjobs sj
--  LEFT OUTER JOIN msdb.dbo.sysjobsteps sjs ON sj.job_id = sjs.job_id
--  LEFT OUTER JOIN msdb.dbo.sysjobstepslogs sjsl ON sjs.step_uid = sjsl.step_uid
------WHERE sj.name = 'MSSQLTips Demo Job'