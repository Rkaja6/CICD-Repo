
CREATE VIEW [tell].[vw_PersonnelHours] AS
SELECT [personnelitem_id]
	  ,WellName
	  ,jobDescription
	  ,j.Category
	  ,j.SubCode
      ,[report_Date]
      ,[line_number]
      ,[reportTypeId]
      ,[Number]
      ,[Hrs]
      ,[Company]
  FROM [dbo].[PersonnelItem] AS P
  LEFT JOIN dbo.JobDetails AS J
	ON P.job_number = J.job_number
  LEFT JOIN dbo.WellInfo W
	ON P.well_id = W.well_id