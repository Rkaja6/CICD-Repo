CREATE PROCEDURE [DW].[sp_ExceptionLogandPurge] AS
BEGIN
--Eventually we could make this a dynamic query that is driven off of a control table to automatically check for global problems (missing/invalid keys)
	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageIHS' AS ObjectSchema,
		'T_PRODUCTION_PRODUCTION_HEADER' AS ObjectName,
		ENTITY AS BusinessKey1,
		'Entity' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		[CADIS_SYSTEM_UPDATED] AS [LoadDate],
		'Business Key is NULL' AS [ExceptionDescription]
	FROM 
		[StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] WITH (NOLOCK)
	WHERE 
		API IS NULL
	
	DELETE FROM [StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] WHERE API IS NULL

	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageIHS' AS ObjectSchema,
		'T_PRODUCTION_PRODUCTION_HEADER' AS ObjectName,
		ENTITY AS BusinessKey1,
		'Entity' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		[CADIS_SYSTEM_UPDATED] AS [LoadDate],
		'Business Key is an empty string' AS [ExceptionDescription]
	FROM 
		[StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] WITH (NOLOCK) 
	WHERE 
		API = ''
	
	DELETE FROM [StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] WHERE API = ''

	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageDI' AS ObjectSchema,
		'ProducingEntities' AS ObjectName,
		EntityId AS BusinessKey1,
		'EntityId' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		UpdatedDate AS [LoadDate],
		'Business Key is NULL' AS [ExceptionDescription]
	FROM 
		[StageDI].[ProducingEntities] WITH (NOLOCK)
	WHERE 
		ApiNo IS NULL
	
	DELETE FROM [StageDI].[ProducingEntities] WHERE ApiNo IS NULL
	
	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageDI' AS ObjectSchema,
		'ProducingEntities' AS ObjectName,
		EntityId AS BusinessKey1,
		'EntityId' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		UpdatedDate AS[LoadDate],
		'Business Key is an empty string' AS [ExceptionDescription]
	FROM 
		[StageDI].[ProducingEntities] WITH (NOLOCK) 
	WHERE 
		ApiNo = ''
	DELETE FROM [StageDI].[ProducingEntities] WHERE ApiNo = ''

	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageDI' AS ObjectSchema,
		'ProducingEntities' AS ObjectName,
		EntityId AS BusinessKey1,
		'EntityId' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		UpdatedDate AS [LoadDate],
		'Business Key is a 0' AS [ExceptionDescription]
	FROM 
		[StageDI].[ProducingEntities] WITH (NOLOCK) 
	WHERE 
		ApiNo = '0'
	DELETE FROM [StageDI].[ProducingEntities] WHERE ApiNo = '0'


	INSERT INTO DW.ExceptionLog
	(
		[ObjectDatabase],
		[ObjectSchema],
		[ObjectName],
		[BusinessKey1],
		[BusinessKeyFieldName1],
		[BusinessKey2],
		[BusinessKeyFieldName2],
		[BusinessKey3],
		[BusinessKeyFieldName3],
		[BusinessKey4],
		[BusinessKeyFieldName4],
		[BusinessKey5],
		[BusinessKeyFieldName5],
		[LoadDate],
		[ExceptionDescription]
	)
	SELECT
		'TELL_DW2' AS ObjectDatabase,
		'StageDI' AS ObjectSchema,
		'WellRollups' AS ObjectName,
		API14 AS BusinessKey1,
		'API14' AS [BusinessKeyFieldName1],
		NULL AS [BusinessKey2],
		NULL AS [BusinessKeyFieldName2],
		NULL AS [BusinessKey3],
		NULL AS [BusinessKeyFieldName3],
		NULL AS [BusinessKey4],
		NULL AS [BusinessKeyFieldName4],
		NULL AS [BusinessKey5],
		NULL AS [BusinessKeyFieldName5],
		UpdatedDate AS [LoadDate],
		'API10 is NULL' AS [ExceptionDescription]
	FROM 
		[StageDI].[WellRollups] WITH (NOLOCK) 
	WHERE 
		API10 IS NULL
	DELETE FROM [StageDI].[WellRollups] WHERE API10 IS NULL

END