
/******************************
** Name:  sp_GenerateSpudCountsTbl
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Creates a TEMP_SpudCounts table used when updating the ConsolidatedForecast 
		  (specfically when running SPUDFCST segments).
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee     Object creation
*******************************/

CREATE PROCEDURE [dbo].[sp_GenerateSpudCountsTbl]
AS
BEGIN

	IF OBJECT_ID('dbo.TEMP_SpudCounts', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_SpudCounts; 

	CREATE TABLE [dbo].[TEMP_SpudCounts]
	(
		[API14] [varchar](20) NOT NULL,
		[SpudDate] [date] NULL,
		[YearSpudDate] [int] NULL,
		[New_Play] [varchar](60) NULL,
		[Status] [varchar](60) NULL,
		[Activity] [varchar](60) NULL,
		[TotalProd] [decimal](18, 0) NULL,
		[FirstProdDate] [datetime2](7) NULL,
		[PeakProdDate] [datetime2](7) NULL
	);

	INSERT INTO [dbo].[TEMP_SpudCounts]
	SELECT
		wh.API14,
		COALESCE(wh.Date_Spud, p.FirstProdDate) AS SpudDate,
		YEAR(COALESCE(wh.Date_Spud, p.FirstProdDate)) as YearSpudDate,
		play.New_Play as New_Play,
		wh.Status,
		wh.Activity,
		p.TotalProd,
		p.FirstProdDate,
		p.PeakProdDate
	FROM
		TELL_DW2.Upstream.WellHeader wh
	LEFT JOIN
		TELL_DW2.Upstream.RefWell_PlayByStateCounty play
	ON
		play.County = wh.County AND
		play.State = wh.State
	LEFT JOIN 
		(
		SELECT
			API,
			SUM(TOT_BOE) as TotalProd,
			MIN([FirstProdDate]) AS FirstProdDate,
			MIN(PeakProdDate) AS PeakProdDate
		FROM
			[TELL_DW2].[Upstream].[UV_AC_PRODUCT_AT]
		GROUP BY 
			API
		) p
	on 
		wh.API14 = p.API
	WHERE 
	-- Exclude inactive wells
		wh.Status <> 'INACTIVE' OR
	-- Include NULL Status wells if there is some other indication they are still active (i.e. drilling or has produced)
		(
		wh.Status IS NULL AND
			(
				wh.Activity <> 'ABANDONED LOCATION' OR 
				(wh.Activity IS NULL AND p.TotalProd > 0)
			)
		)

END