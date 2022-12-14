
CREATE PROCEDURE [dbo].[ProcessWilliamsData_manual] AS
INSERT INTO [Pipeline_Data].[dbo].[rawWilliamsTranscoOperationalCapacity]
(	[TSP]
      ,[TSP Name]
      ,[Effective Gas Day]
      ,[Effective Time]
      ,[Meas Basis Desc]
      ,[Cycle Desc]
      ,[Posting Date]
      ,[Posting Time]
      ,[Loc QTI Desc]
      ,[Loc]
      ,[Loc Pur Desc]
      ,[Flow Ind]
      ,[Loc Name]
      ,[Loc Zn]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Scheduled Quantity]
      ,[Operationally Available Capacity]
      ,[IT Indicator]
      ,[All Qty Avail]
      ,[Qty Reason])
SELECT
		[TSP]
      ,[TSP Name]
      ,[Effective Gas Day]
      ,[Effective Time]
      ,[Meas Basis Desc]
      ,[Cycle Desc]
      ,[Posting Date]
      ,[Posting Time]
      ,[Loc QTI Desc]
      ,[Loc]
      ,[Loc Pur Desc]
      ,[Flow Ind]
      ,[Loc Name]
      ,[Loc Zn]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Scheduled Quantity]
      ,[Operationally Available Capacity]
      ,[IT Indicator]
      ,[All Qty Avail]
      ,[Qty Reason]
  FROM
[Pipeline_Data].[dbo].[vw_TransformRawWilliamsData_old]