
/******************************
** Name:  sp_DropForecastTempTbls
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Cleans up temp tables generated during parent stored procedure.
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee     Object creation
*******************************/

CREATE PROCEDURE [dbo].[sp_DropForecastTempTbls]
AS
BEGIN

	IF OBJECT_ID('dbo.TEMP_SpudCounts', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_SpudCounts; 

	IF OBJECT_ID('dbo.TEMP_BaseProd', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_BaseProd; 

	IF OBJECT_ID('dbo.TEMP_SpudForecast', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_SpudForecast; 

	IF OBJECT_ID('dbo.TEMP_RigForecast', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_RigForecast; 

END