CREATE PROCEDURE [Upstream].[sp_PopulateTransformationQueries]
	AS

		TRUNCATE TABLE UPSTREAM.TransformationQueries;
		-- blank varchar fields
		INSERT INTO UPSTREAM.TransformationQueries (Label, QuerySQL)
		SELECT
			'WellHeader' AS Label,
		   'UPDATE ['+T.TABLE_SCHEMA+'].[' + T.TABLE_NAME + '] SET [' + COLUMN_NAME + '] = NULL 
		   WHERE [' + COLUMN_NAME + '] = ''''' AS QuerySQL
		FROM 
			INFORMATION_SCHEMA.columns C
		INNER JOIN
			INFORMATION_SCHEMA.TABLES T ON C.TABLE_NAME=T.TABLE_NAME AND C.TABLE_SCHEMA=T.TABLE_SCHEMA
		WHERE 
			DATA_TYPE = 'varchar'
		AND C.IS_NULLABLE='YES'
		AND T.TABLE_NAME ='WellHeader_AllSources'
		AND T.TABLE_SCHEMA = 'Upstream'


		-- 'UNKNOWN' or 'OTHER' varchar fields
		INSERT INTO UPSTREAM.TransformationQueries (Label, QuerySQL)
		SELECT
			'WellHeader' AS Label,
		   'UPDATE ['+T.TABLE_SCHEMA+'].[' + T.TABLE_NAME + '] SET [' + COLUMN_NAME + '] = NULL 
		   WHERE [' + COLUMN_NAME + '] IN (''UNKNOWN'',''OTHER'',''(N/A)'',''N/A'')' as QuerySQL
		FROM 
			INFORMATION_SCHEMA.columns C
		INNER JOIN
			INFORMATION_SCHEMA.TABLES T ON C.TABLE_NAME=T.TABLE_NAME AND C.TABLE_SCHEMA=T.TABLE_SCHEMA
		WHERE 
			DATA_TYPE = 'varchar'
		AND C.IS_NULLABLE='YES'
		AND T.TABLE_NAME ='WellHeader_AllSources'
		AND T.TABLE_SCHEMA = 'Upstream'

		-- bad date fields
		INSERT INTO UPSTREAM.TransformationQueries (Label, QuerySQL)
		SELECT
			'WellHeader' AS Label,
			'UPDATE ['+T.TABLE_SCHEMA+'].[' + T.TABLE_NAME + '] SET [' + COLUMN_NAME + '] = NULL 
		   WHERE [' + COLUMN_NAME + '] = ''01-01-1900''' as QuerySQL
		FROM 
			INFORMATION_SCHEMA.columns C
		INNER JOIN
			INFORMATION_SCHEMA.TABLES T ON C.TABLE_NAME=T.TABLE_NAME AND C.TABLE_SCHEMA=T.TABLE_SCHEMA
		WHERE 
			DATA_TYPE = 'date'
		AND C.IS_NULLABLE='YES'
		AND T.TABLE_NAME ='WellHeader_AllSources'
		AND T.TABLE_SCHEMA = 'Upstream'

		-- bad lat/longs
		INSERT INTO UPSTREAM.TransformationQueries (Label, QuerySQL)
		SELECT
			'WellHeader' AS Label,
			'UPDATE ['+T.TABLE_SCHEMA+'].[' + T.TABLE_NAME + '] SET [' + COLUMN_NAME + '] = NULL 
		   WHERE [' + COLUMN_NAME + '] = 0' AS QuerySQL
		FROM 
			INFORMATION_SCHEMA.columns C
		INNER JOIN
			INFORMATION_SCHEMA.TABLES T ON C.TABLE_NAME=T.TABLE_NAME AND C.TABLE_SCHEMA=T.TABLE_SCHEMA
		WHERE 
			C.IS_NULLABLE='YES'
		AND T.TABLE_NAME ='WellHeader_AllSources'
		AND T.TABLE_SCHEMA = 'Upstream'
		AND C.COLUMN_NAME in 
			(
			'Surface_Hole_Latitude',
			'Surface_Hole_Longitude',
			'Bottom_Hole_Latitude',
			'Bottom_Hole_Longitude'
			)