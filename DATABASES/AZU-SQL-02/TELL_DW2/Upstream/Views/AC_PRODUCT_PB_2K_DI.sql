/******************************
** Name:  AC_PRODUCT_PB_2K_DI
** Desc:  View to replace the table from IHS Meridian with data from the data warehouse.  This dataset was originally written
**        to only retrieve DI data, but we currently merge both IHS/DI and eventually Rystad production data, so this view
**        is in place to make certain that older queries don't fail.  If we decide that we really need to look at DI data 
**        seperately, we should look to build the business logic into the transformations from the data vault.
** Auth:  Aaron Vogt
** Date:  11/18/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[AC_PRODUCT_PB_2K_DI]
	AS
SELECT PROD.[API]
      ,PROD.[Month_Start_Date]
      ,PROD.[YEAR]
      ,PROD.[MONTH]
      ,COALESCE(PROD.[TOT_LIQUID],0) AS [TOT_LIQUID]
      ,COALESCE(PROD.[TOT_GAS],0) AS [TOT_GAS]
      ,COALESCE(PROD.[TOT_WATER],0) AS [TOT_WATER]
      ,COALESCE(PROD.[TOT_BOE],0) AS [TOT_BOE]
      ,PROD.[MAX_NUM_WELLS]
      ,PROD.[MAX_DAYS_ON]
      ,PROD.[RECORD_CREATION_DATE]
      ,PROD.[RECORD_UPDATE_DATE]
      ,PROD.[PeakProdDate]
      ,PROD.[FirstProdDate]
      ,PROD.[Months_Since_PeakProd]
      ,PROD.[Months_Since_FirstProd]
	  , 'DI' as Record_Source
	FROM
		-----------------------------------------------
		--In the IHSM system, this was pulling production data from DI only using the following reference
		--[Upstream].[DI_AC_PRODUCT_AT] PROD
		-----------------------------------------------
		[Upstream].[UV_AC_PRODUCT_AT] PROD WITH (NOLOCK)
	INNER JOIN 
		[Upstream].AC_PROP_PB PROP
	ON
		PROD.API = PROP.UWI
	WHERE (YEAR(PROD.FirstProdDate) > 2000);