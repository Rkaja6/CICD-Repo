create procedure ETL.Proc_Update_ETL_ProdVSales
AS

truncate table [ETL].[ProdVSales];
 
insert into [ETL].[ProdVSales] 
SELECT 
	COALESCE(EOMONTH(bolo.Activity_Month,0), EOMONTH(prod.Month_End_Date,0)) AS Date,
	COALESCE(bolo.API_Well_No, prod.API) AS API,
	COALESCE(bolo.[Cost_Center], prod.unitname) AS [Cost Center],
	COALESCE(bolo.[Operated_Property_Flag],		
		CASE WHEN prod.[FlowNetworkName] = 'NORTH LOUISIANA'
			THEN 'O'
			ELSE 'N'
		END) AS [Op or Nonop],
	bolo.Transaction_Value as [Bolo Gas Sales],
	prod.VolProdAllocGas as [Alloc Gas Production],
	prod.VolDispSaleGas as [ProdView Gas Sales],
	prod.VolDispFuelGas as [Fuel Gas],
	bolo.[Cost_Center_Number],
	COALESCE(bolo.[County], prod.[County]) AS [County],
	COALESCE(bolo.[District], prod.[District]) AS [District],
	COALESCE(bolo.[Area], prod.[Area]) AS [Area],
	COALESCE(bolo.[Field], prod.[Field]) AS [Field],
	COALESCE(bolo.[Operator], prod.[Operator]) AS [Operator],
	prod.[WorkingInterest],
	prod.Gas_NRI,
	prod.Producing_Method,
	prod.ARIES_Propnum,
	prod.Downtime_Type,
	prod.Downtime_Code,
	DATEDIFF(D,prod.Downtime_StartDate, prod.Downtime_EndDate) + 1 as [Downtime_Duration]
  FROM 
	(
	SELECT
      [Cost_Center]
      ,[Cost_Center_Number]
      ,[Cost_Center_Type]
      ,[State]
      ,[County]
      ,[District]
      ,[Area]
      ,[Field]
      ,[Operator]
      ,[Operated_Property_Flag]
      ,[WellName]
      ,[API_Well_No]
      ,[Activity_Month]
      ,SUM([Transaction_Value]) AS [Transaction_Value]
	FROM [BOLO].[V_GROSS_LOS]
	WHERE Row_Heading = 'Gas Volume (MCF)'
	GROUP BY 
	 [Cost_Center]
      ,[Cost_Center_Number]
      ,[Cost_Center_Type]
      ,[State]
      ,[County]
      ,[District]
      ,[Area]
      ,[Field]
      ,[Operator]
      ,[Operated_Property_Flag]
      ,[WellName]
      ,[API_Well_No]
      ,[Activity_Month]
	) bolo
  full outer join PEL.V_Monthly_Alloc_Prod prod
  on bolo.API_Well_No = prod.API
  and EOMONTH(bolo.Activity_Month,0) = EOMONTH(prod.Month_End_Date,0);

update a
set [Cost Center Number] = c.Cost_Center_Number,
	[Cost Center] = c.Cost_Center
from etl.ProdVSales a
inner join bolo.Cost_Center c
on a.API = c.API_WELL_NO