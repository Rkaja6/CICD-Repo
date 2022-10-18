create procedure sp_ImportXML 
@filename as nvarchar(200)
AS
BEGIN

BEGIN TRANSACTION [Tran1]
BEGIN TRY 
	IF EXISTS(SELECT 1 
			  FROM   sys.tables 
			  WHERE  NAME = 'XMLImports') 
	  DROP TABLE xmlimports 
 
	-- Creates a table to hold the XML data, as well as when it was pulled in 
	CREATE TABLE xmlimports 
	( 
		id         INT IDENTITY PRIMARY KEY, 
		xmldata    XML, 
		dttmimport DATETIME 
	) 
 
	-- Fills the table with data from the .xml file key part here is the conversion of BulkColumn to XML data type
 
	-- Fills the table with data from the .xml file key part here is the conversion of BulkColumn to XML data type  
	DECLARE @execcmd VARCHAR(1000)
	SET @execcmd = 
	-- Unfortunately you cannot add variables to OPENROWSET and must create a query string and execute it 
	'select CONVERT(XML, BulkColumn) as BulkColumn, GETDATE() ' +
	' from OPENROWSET(BULK ''' + @filename + ''', SINGLE_BLOB) as x '
	INSERT INTO XMLImports(XMLData, DtTmImport)
	EXEC(@execcmd)
 
	-- Sets up variables for the prep XML procedure
	DECLARE @xml  AS XML, 
			@hDoc AS INT 
 
	-- Loads variable from table  
	SELECT @xml = xmldata 
	FROM   xmlimports 
 
	-- The stored procedure basically takes the @xml data and puts it in memory like a table that can be queried by OPENXML 
	EXEC Sp_xml_preparedocument 
	  @hDoc output, 
	  @xml 

    --The statements below clear up the delete related tables
    DELETE FROM DeletedDailyReports
    DELETE FROM DeletedJobs
    DELETE FROM DeletedWells
    DELETE FROM DeletedLocations

    --The statements below populate the delete related tables
    INSERT INTO DeletedDailyReports select * from OPENXML(@hDoc, 'ROOT/DeletedDailyReports/row') with DeletedDailyReports
    INSERT INTO DeletedJobs select * from OPENXML(@hDoc, 'ROOT/DeletedJobs/row') with DeletedJobs
    INSERT INTO DeletedWells select * from OPENXML(@hDoc, 'ROOT/DeletedWells/row') with DeletedWells
    INSERT INTO DeletedLocations select * from OPENXML(@hDoc, 'ROOT/DeletedLocations/row') with DeletedLocations
 
    -- The statements below delete data from all WellEz tables    
DELETE FROM
    UOM
WHERE
    UOM_id IN
    (
        SELECT
            UOM_id
        FROM
            UOM a
        INNER JOIN OPENXML(@hDoc, 'ROOT/UOM/row') WITH UOM x
            ON a.LookupItemID = x.lookupItemID
    )

DELETE FROM 
	CostVendor 
WHERE 
	CostVendor_id IN
	( 
		SELECT 
			CostVendor_id
		FROM 
			CostVendor a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CostVendor/row') WITH CostVendor x
			ON a.RowId = x.RowId 
      WHERE 
			x.RowId IS NOT NULL

        )

DELETE FROM 
	AFE 
WHERE 
	AFE_id IN
	( 
		SELECT 
			AFE_id
		FROM 
			AFE a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/AFE/row') WITH AFE x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	AFEItems 
WHERE 
	AFEItems_id IN
	( 
		SELECT 
			AFEItems_id
		FROM 
			AFEItems a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/AFEItems/row') WITH AFEItems x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DailyOps 
WHERE 
	DailyOps_id IN
	( 
		SELECT 
			DailyOps_id
		FROM 
			DailyOps a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DailyOps/row') WITH DailyOps x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DailyOps2 
WHERE 
	DailyOps2_id IN
	( 
		SELECT 
			DailyOps2_id
		FROM 
			DailyOps2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DailyOps2/row') WITH DailyOps2 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DailyOps3 
WHERE 
	DailyOps3_id IN
	( 
		SELECT 
			DailyOps3_id
		FROM 
			DailyOps3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DailyOps3/row') WITH DailyOps3 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	TimeLog 
WHERE 
	TimeLog_id IN
	( 
		SELECT 
			TimeLog_id
		FROM 
			TimeLog a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/TimeLog/row') WITH TimeLog x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	TimeLogActivityItem 
WHERE 
	TimeLogActivityItem_id IN
	( 
		SELECT 
			TimeLogActivityItem_id
		FROM 
			TimeLogActivityItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/TimeLogActivityItem/row') WITH TimeLogActivityItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	ActivityTimes 
WHERE 
	ActivityTimes_id IN
	( 
		SELECT 
			ActivityTimes_id
		FROM 
			ActivityTimes a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/ActivityTimes/row') WITH ActivityTimes x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	ActivityTimesItem 
WHERE 
	ActivityTimesItem_id IN
	( 
		SELECT 
			ActivityTimesItem_id
		FROM 
			ActivityTimesItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/ActivityTimesItem/row') WITH ActivityTimesItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	BHA 
WHERE 
	BHA_id IN
	( 
		SELECT 
			BHA_id
		FROM 
			BHA a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/BHA/row') WITH BHA x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	BHAItem 
WHERE 
	BHAItem_id IN
	( 
		SELECT 
			BHAItem_id
		FROM 
			BHAItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/BHAItem/row') WITH BHAItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEBOP 
WHERE 
	WFEBOP_id IN
	( 
		SELECT 
			WFEBOP_id
		FROM 
			WFEBOP a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEBOP/row') WITH WFEBOP x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Casing 
WHERE 
	Casing_id IN
	( 
		SELECT 
			Casing_id
		FROM 
			Casing a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Casing/row') WITH Casing x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	CasingItem 
WHERE 
	CasingItem_id IN
	( 
		SELECT 
			CasingItem_id
		FROM 
			CasingItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CasingItem/row') WITH CasingItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Tubing 
WHERE 
	Tubing_id IN
	( 
		SELECT 
			Tubing_id
		FROM 
			Tubing a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Tubing/row') WITH Tubing x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	TubingItem 
WHERE 
	TubingItem_id IN
	( 
		SELECT 
			TubingItem_id
		FROM 
			TubingItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/TubingItem/row') WITH TubingItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	DrillingCost 
WHERE 
	DrillingCost_id IN
	( 
		SELECT 
			DrillingCost_id
		FROM 
			DrillingCost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DrillingCost/row') WITH DrillingCost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DrillingCostItem 
WHERE 
	DrillingCostItem_id IN
	( 
		SELECT 
			DrillingCostItem_id
		FROM 
			DrillingCostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DrillingCostItem/row') WITH DrillingCostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DrillingCostContingency 
WHERE 
	DrillingCostContingency_id IN
	( 
		SELECT 
			DrillingCostContingency_id
		FROM 
			DrillingCostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DrillingCostContingency/row') WITH DrillingCostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	CompletionCost 
WHERE 
	CompletionCost_id IN
	( 
		SELECT 
			CompletionCost_id
		FROM 
			CompletionCost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CompletionCost/row') WITH CompletionCost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	CompletionCostItem 
WHERE 
	CompletionCostItem_id IN
	( 
		SELECT 
			CompletionCostItem_id
		FROM 
			CompletionCostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CompletionCostItem/row') WITH CompletionCostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	CompletionCostContingency 
WHERE 
	CompletionCostContingency_id IN
	( 
		SELECT 
			CompletionCostContingency_id
		FROM 
			CompletionCostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CompletionCostContingency/row') WITH CompletionCostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WorkoverCost 
WHERE 
	WorkoverCost_id IN
	( 
		SELECT 
			WorkoverCost_id
		FROM 
			WorkoverCost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WorkoverCost/row') WITH WorkoverCost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WorkoverCostItem 
WHERE 
	WorkoverCostItem_id IN
	( 
		SELECT 
			WorkoverCostItem_id
		FROM 
			WorkoverCostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WorkoverCostItem/row') WITH WorkoverCostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WorkoverCostContingency 
WHERE 
	WorkoverCostContingency_id IN
	( 
		SELECT 
			WorkoverCostContingency_id
		FROM 
			WorkoverCostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WorkoverCostContingency/row') WITH WorkoverCostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	FacilitiesCost 
WHERE 
	FacilitiesCost_id IN
	( 
		SELECT 
			FacilitiesCost_id
		FROM 
			FacilitiesCost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/FacilitiesCost/row') WITH FacilitiesCost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	FacilitiesCostItem 
WHERE 
	FacilitiesCostItem_id IN
	( 
		SELECT 
			FacilitiesCostItem_id
		FROM 
			FacilitiesCostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/FacilitiesCostItem/row') WITH FacilitiesCostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	FacilitiesCostContingency 
WHERE 
	FacilitiesCostContingency_id IN
	( 
		SELECT 
			FacilitiesCostContingency_id
		FROM 
			FacilitiesCostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/FacilitiesCostContingency/row') WITH FacilitiesCostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	ProductionCost 
WHERE 
	ProductionCost_id IN
	( 
		SELECT 
			ProductionCost_id
		FROM 
			ProductionCost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/ProductionCost/row') WITH ProductionCost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	ProductionCostItem 
WHERE 
	ProductionCostItem_id IN
	( 
		SELECT 
			ProductionCostItem_id
		FROM 
			ProductionCostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/ProductionCostItem/row') WITH ProductionCostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	ProductionCostContingency 
WHERE 
	ProductionCostContingency_id IN
	( 
		SELECT 
			ProductionCostContingency_id
		FROM 
			ProductionCostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/ProductionCostContingency/row') WITH ProductionCostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	LOECost 
WHERE 
	LOECost_id IN
	( 
		SELECT 
			LOECost_id
		FROM 
			LOECost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/LOECost/row') WITH LOECost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	LOECostItem 
WHERE 
	LOECostItem_id IN
	( 
		SELECT 
			LOECostItem_id
		FROM 
			LOECostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/LOECostItem/row') WITH LOECostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	LOECostContingency 
WHERE 
	LOECostContingency_id IN
	( 
		SELECT 
			LOECostContingency_id
		FROM 
			LOECostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/LOECostContingency/row') WITH LOECostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	NonAFECost 
WHERE 
	NonAFECost_id IN
	( 
		SELECT 
			NonAFECost_id
		FROM 
			NonAFECost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/NonAFECost/row') WITH NonAFECost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	NonAFECostItem 
WHERE 
	NonAFECostItem_id IN
	( 
		SELECT 
			NonAFECostItem_id
		FROM 
			NonAFECostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/NonAFECostItem/row') WITH NonAFECostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	NonAFECostContingency 
WHERE 
	NonAFECostContingency_id IN
	( 
		SELECT 
			NonAFECostContingency_id
		FROM 
			NonAFECostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/NonAFECostContingency/row') WITH NonAFECostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom1Cost 
WHERE 
	Custom1Cost_id IN
	( 
		SELECT 
			Custom1Cost_id
		FROM 
			Custom1Cost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom1Cost/row') WITH Custom1Cost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom1CostItem 
WHERE 
	Custom1CostItem_id IN
	( 
		SELECT 
			Custom1CostItem_id
		FROM 
			Custom1CostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom1CostItem/row') WITH Custom1CostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom1CostContingency 
WHERE 
	Custom1CostContingency_id IN
	( 
		SELECT 
			Custom1CostContingency_id
		FROM 
			Custom1CostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom1CostContingency/row') WITH Custom1CostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom2Cost 
WHERE 
	Custom2Cost_id IN
	( 
		SELECT 
			Custom2Cost_id
		FROM 
			Custom2Cost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom2Cost/row') WITH Custom2Cost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom2CostItem 
WHERE 
	Custom2CostItem_id IN
	( 
		SELECT 
			Custom2CostItem_id
		FROM 
			Custom2CostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom2CostItem/row') WITH Custom2CostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom2CostContingency 
WHERE 
	Custom2CostContingency_id IN
	( 
		SELECT 
			Custom2CostContingency_id
		FROM 
			Custom2CostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom2CostContingency/row') WITH Custom2CostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom3Cost 
WHERE 
	Custom3Cost_id IN
	( 
		SELECT 
			Custom3Cost_id
		FROM 
			Custom3Cost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom3Cost/row') WITH Custom3Cost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom3CostItem 
WHERE 
	Custom3CostItem_id IN
	( 
		SELECT 
			Custom3CostItem_id
		FROM 
			Custom3CostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom3CostItem/row') WITH Custom3CostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom3CostContingency 
WHERE 
	Custom3CostContingency_id IN
	( 
		SELECT 
			Custom3CostContingency_id
		FROM 
			Custom3CostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom3CostContingency/row') WITH Custom3CostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom4Cost 
WHERE 
	Custom4Cost_id IN
	( 
		SELECT 
			Custom4Cost_id
		FROM 
			Custom4Cost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom4Cost/row') WITH Custom4Cost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom4CostItem 
WHERE 
	Custom4CostItem_id IN
	( 
		SELECT 
			Custom4CostItem_id
		FROM 
			Custom4CostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom4CostItem/row') WITH Custom4CostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom4CostContingency 
WHERE 
	Custom4CostContingency_id IN
	( 
		SELECT 
			Custom4CostContingency_id
		FROM 
			Custom4CostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom4CostContingency/row') WITH Custom4CostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom5Cost 
WHERE 
	Custom5Cost_id IN
	( 
		SELECT 
			Custom5Cost_id
		FROM 
			Custom5Cost a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom5Cost/row') WITH Custom5Cost x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom5CostItem 
WHERE 
	Custom5CostItem_id IN
	( 
		SELECT 
			Custom5CostItem_id
		FROM 
			Custom5CostItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom5CostItem/row') WITH Custom5CostItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	Custom5CostContingency 
WHERE 
	Custom5CostContingency_id IN
	( 
		SELECT 
			Custom5CostContingency_id
		FROM 
			Custom5CostContingency a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Custom5CostContingency/row') WITH Custom5CostContingency x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	CostAllocation 
WHERE 
	CostAllocation_id IN
	( 
		SELECT 
			CostAllocation_id
		FROM 
			CostAllocation a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CostAllocation/row') WITH CostAllocation x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	CostAllocationItem 
WHERE 
	CostAllocationItem_id IN
	( 
		SELECT 
			CostAllocationItem_id
		FROM 
			CostAllocationItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CostAllocationItem/row') WITH CostAllocationItem x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WFEConsumables 
WHERE 
	WFEConsumables_id IN
	( 
		SELECT 
			WFEConsumables_id
		FROM 
			WFEConsumables a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEConsumables/row') WITH WFEConsumables x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WFEConsumableItem 
WHERE 
	WFEConsumableItem_id IN
	( 
		SELECT 
			WFEConsumableItem_id
		FROM 
			WFEConsumableItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEConsumableItem/row') WITH WFEConsumableItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WFETransport 
WHERE 
	WFETransport_id IN
	( 
		SELECT 
			WFETransport_id
		FROM 
			WFETransport a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFETransport/row') WITH WFETransport x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFETransportVessel 
WHERE 
	WFETransportVessel_id IN
	( 
		SELECT 
			WFETransportVessel_id
		FROM 
			WFETransportVessel a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFETransportVessel/row') WITH WFETransportVessel x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFETransportHelicopter 
WHERE 
	WFETransportHelicopter_id IN
	( 
		SELECT 
			WFETransportHelicopter_id
		FROM 
			WFETransportHelicopter a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFETransportHelicopter/row') WITH WFETransportHelicopter x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Survey 
WHERE 
	Survey_id IN
	( 
		SELECT 
			Survey_id
		FROM 
			Survey a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Survey/row') WITH Survey x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	SurveyItem 
WHERE 
	SurveyItem_id IN
	( 
		SELECT 
			SurveyItem_id
		FROM 
			SurveyItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/SurveyItem/row') WITH SurveyItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEPerforation 
WHERE 
	WFEPerforation_id IN
	( 
		SELECT 
			WFEPerforation_id
		FROM 
			WFEPerforation a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEPerforation/row') WITH WFEPerforation x
			ON a.well_id = x.well_id 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
			x.well_id IS NOT NULL
            OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEPerforationItem 
WHERE 
	WFEPerforationItem_id IN
	( 
		SELECT 
			WFEPerforationItem_id
		FROM 
			WFEPerforationItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEPerforationItem/row') WITH WFEPerforationItem x
			ON a.well_id = x.well_id 
          AND a.RowId = x.RowId
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
			x.well_id IS NOT NULL
            OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Flowback 
WHERE 
	Flowback_id IN
	( 
		SELECT 
			Flowback_id
		FROM 
			Flowback a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Flowback/row') WITH Flowback x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	FlowbackItem 
WHERE 
	FlowbackItem_id IN
	( 
		SELECT 
			FlowbackItem_id
		FROM 
			FlowbackItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/FlowbackItem/row') WITH FlowbackItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WellInfo 
WHERE 
	WellInfo_id IN
	( 
		SELECT 
			WellInfo_id
		FROM 
			WellInfo a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WellInfo/row') WITH WellInfo x
			ON a.well_id = x.well_id 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
			x.well_id IS NOT NULL
            OR w.well_id IS NOT NULL

        )

DELETE FROM 
	LocationInfo 
WHERE 
	LocationInfo_id IN
	( 
		SELECT 
			LocationInfo_id
		FROM 
			LocationInfo a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/LocationInfo/row') WITH LocationInfo x
			ON a.location_id = x.location_id 
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
			x.location_id IS NOT NULL
            OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WkgInterest 
WHERE 
	WkgInterest_id IN
	( 
		SELECT 
			WkgInterest_id
		FROM 
			WkgInterest a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WkgInterest/row') WITH WkgInterest x
			ON a.well_id = x.well_id 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
			x.well_id IS NOT NULL
            OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WkgInterestItem 
WHERE 
	WkgInterestItem_id IN
	( 
		SELECT 
			WkgInterestItem_id
		FROM 
			WkgInterestItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WkgInterestItem/row') WITH WkgInterestItem x
			ON a.well_id = x.well_id 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
			x.well_id IS NOT NULL
            OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobDetails 
WHERE 
	JobDetails_id IN
	( 
		SELECT 
			JobDetails_id
		FROM 
			JobDetails a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobDetails/row') WITH JobDetails x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	DatumPoints 
WHERE 
	DatumPoints_id IN
	( 
		SELECT 
			DatumPoints_id
		FROM 
			DatumPoints a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DatumPoints/row') WITH DatumPoints x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFERigElevation 
WHERE 
	WFERigElevation_id IN
	( 
		SELECT 
			WFERigElevation_id
		FROM 
			WFERigElevation a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFERigElevation/row') WITH WFERigElevation x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Environmental 
WHERE 
	Environmental_id IN
	( 
		SELECT 
			Environmental_id
		FROM 
			Environmental a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Environmental/row') WITH Environmental x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Pumps 
WHERE 
	Pumps_id IN
	( 
		SELECT 
			Pumps_id
		FROM 
			Pumps a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Pumps/row') WITH Pumps x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	PumpItems 
WHERE 
	PumpItems_id IN
	( 
		SELECT 
			PumpItems_id
		FROM 
			PumpItems a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/PumpItems/row') WITH PumpItems x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Packers 
WHERE 
	Packers_id IN
	( 
		SELECT 
			Packers_id
		FROM 
			Packers a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Packers/row') WITH Packers x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	PackerItem 
WHERE 
	PackerItem_id IN
	( 
		SELECT 
			PackerItem_id
		FROM 
			PackerItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/PackerItem/row') WITH PackerItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	DrillBreak 
WHERE 
	DrillBreak_id IN
	( 
		SELECT 
			DrillBreak_id
		FROM 
			DrillBreak a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DrillBreak/row') WITH DrillBreak x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	DrillBreakItem 
WHERE 
	DrillBreakItem_id IN
	( 
		SELECT 
			DrillBreakItem_id
		FROM 
			DrillBreakItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/DrillBreakItem/row') WITH DrillBreakItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Weather 
WHERE 
	Weather_id IN
	( 
		SELECT 
			Weather_id
		FROM 
			Weather a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Weather/row') WITH Weather x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Solids 
WHERE 
	Solids_id IN
	( 
		SELECT 
			Solids_id
		FROM 
			Solids a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Solids/row') WITH Solids x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Cementing 
WHERE 
	Cementing_id IN
	( 
		SELECT 
			Cementing_id
		FROM 
			Cementing a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Cementing/row') WITH Cementing x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	CementingItem 
WHERE 
	CementingItem_id IN
	( 
		SELECT 
			CementingItem_id
		FROM 
			CementingItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CementingItem/row') WITH CementingItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	CompletionFluid 
WHERE 
	CompletionFluid_id IN
	( 
		SELECT 
			CompletionFluid_id
		FROM 
			CompletionFluid a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/CompletionFluid/row') WITH CompletionFluid x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEDrillBit 
WHERE 
	WFEDrillBit_id IN
	( 
		SELECT 
			WFEDrillBit_id
		FROM 
			WFEDrillBit a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEDrillBit/row') WITH WFEDrillBit x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEDrillBitItem 
WHERE 
	WFEDrillBitItem_id IN
	( 
		SELECT 
			WFEDrillBitItem_id
		FROM 
			WFEDrillBitItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEDrillBitItem/row') WITH WFEDrillBitItem x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	Personnel 
WHERE 
	Personnel_id IN
	( 
		SELECT 
			Personnel_id
		FROM 
			Personnel a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/Personnel/row') WITH Personnel x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	PersonnelItem 
WHERE 
	PersonnelItem_id IN
	( 
		SELECT 
			PersonnelItem_id
		FROM 
			PersonnelItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/PersonnelItem/row') WITH PersonnelItem x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEWellPlan 
WHERE 
	WFEWellPlan_id IN
	( 
		SELECT 
			WFEWellPlan_id
		FROM 
			WFEWellPlan a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEWellPlan/row') WITH WFEWellPlan x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEWellPlanItem 
WHERE 
	WFEWellPlanItem_id IN
	( 
		SELECT 
			WFEWellPlanItem_id
		FROM 
			WFEWellPlanItem a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEWellPlanItem/row') WITH WFEWellPlanItem x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_1 
WHERE 
	UserDefined_1_id IN
	( 
		SELECT 
			UserDefined_1_id
		FROM 
			UserDefined_1 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_1/row') WITH UserDefined_1 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_1 
WHERE 
	UserDefinedItem_1_id IN
	( 
		SELECT 
			UserDefinedItem_1_id
		FROM 
			UserDefinedItem_1 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_1/row') WITH UserDefinedItem_1 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_2 
WHERE 
	UserDefined_2_id IN
	( 
		SELECT 
			UserDefined_2_id
		FROM 
			UserDefined_2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_2/row') WITH UserDefined_2 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_2 
WHERE 
	UserDefinedItem_2_id IN
	( 
		SELECT 
			UserDefinedItem_2_id
		FROM 
			UserDefinedItem_2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_2/row') WITH UserDefinedItem_2 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_3 
WHERE 
	UserDefined_3_id IN
	( 
		SELECT 
			UserDefined_3_id
		FROM 
			UserDefined_3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_3/row') WITH UserDefined_3 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_3 
WHERE 
	UserDefinedItem_3_id IN
	( 
		SELECT 
			UserDefinedItem_3_id
		FROM 
			UserDefinedItem_3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_3/row') WITH UserDefinedItem_3 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_4 
WHERE 
	UserDefined_4_id IN
	( 
		SELECT 
			UserDefined_4_id
		FROM 
			UserDefined_4 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_4/row') WITH UserDefined_4 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_4 
WHERE 
	UserDefinedItem_4_id IN
	( 
		SELECT 
			UserDefinedItem_4_id
		FROM 
			UserDefinedItem_4 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_4/row') WITH UserDefinedItem_4 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_5 
WHERE 
	UserDefined_5_id IN
	( 
		SELECT 
			UserDefined_5_id
		FROM 
			UserDefined_5 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_5/row') WITH UserDefined_5 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_5 
WHERE 
	UserDefinedItem_5_id IN
	( 
		SELECT 
			UserDefinedItem_5_id
		FROM 
			UserDefinedItem_5 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_5/row') WITH UserDefinedItem_5 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_6 
WHERE 
	UserDefined_6_id IN
	( 
		SELECT 
			UserDefined_6_id
		FROM 
			UserDefined_6 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_6/row') WITH UserDefined_6 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_6 
WHERE 
	UserDefinedItem_6_id IN
	( 
		SELECT 
			UserDefinedItem_6_id
		FROM 
			UserDefinedItem_6 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_6/row') WITH UserDefinedItem_6 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_7 
WHERE 
	UserDefined_7_id IN
	( 
		SELECT 
			UserDefined_7_id
		FROM 
			UserDefined_7 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_7/row') WITH UserDefined_7 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_7 
WHERE 
	UserDefinedItem_7_id IN
	( 
		SELECT 
			UserDefinedItem_7_id
		FROM 
			UserDefinedItem_7 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_7/row') WITH UserDefinedItem_7 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_8 
WHERE 
	UserDefined_8_id IN
	( 
		SELECT 
			UserDefined_8_id
		FROM 
			UserDefined_8 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_8/row') WITH UserDefined_8 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_8 
WHERE 
	UserDefinedItem_8_id IN
	( 
		SELECT 
			UserDefinedItem_8_id
		FROM 
			UserDefinedItem_8 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_8/row') WITH UserDefinedItem_8 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_9 
WHERE 
	UserDefined_9_id IN
	( 
		SELECT 
			UserDefined_9_id
		FROM 
			UserDefined_9 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_9/row') WITH UserDefined_9 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_9 
WHERE 
	UserDefinedItem_9_id IN
	( 
		SELECT 
			UserDefinedItem_9_id
		FROM 
			UserDefinedItem_9 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_9/row') WITH UserDefinedItem_9 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_10 
WHERE 
	UserDefined_10_id IN
	( 
		SELECT 
			UserDefined_10_id
		FROM 
			UserDefined_10 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_10/row') WITH UserDefined_10 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_10 
WHERE 
	UserDefinedItem_10_id IN
	( 
		SELECT 
			UserDefinedItem_10_id
		FROM 
			UserDefinedItem_10 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_10/row') WITH UserDefinedItem_10 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_11 
WHERE 
	UserDefined_11_id IN
	( 
		SELECT 
			UserDefined_11_id
		FROM 
			UserDefined_11 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_11/row') WITH UserDefined_11 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_11 
WHERE 
	UserDefinedItem_11_id IN
	( 
		SELECT 
			UserDefinedItem_11_id
		FROM 
			UserDefinedItem_11 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_11/row') WITH UserDefinedItem_11 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_12 
WHERE 
	UserDefined_12_id IN
	( 
		SELECT 
			UserDefined_12_id
		FROM 
			UserDefined_12 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_12/row') WITH UserDefined_12 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_12 
WHERE 
	UserDefinedItem_12_id IN
	( 
		SELECT 
			UserDefinedItem_12_id
		FROM 
			UserDefinedItem_12 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_12/row') WITH UserDefinedItem_12 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_13 
WHERE 
	UserDefined_13_id IN
	( 
		SELECT 
			UserDefined_13_id
		FROM 
			UserDefined_13 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_13/row') WITH UserDefined_13 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_13 
WHERE 
	UserDefinedItem_13_id IN
	( 
		SELECT 
			UserDefinedItem_13_id
		FROM 
			UserDefinedItem_13 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_13/row') WITH UserDefinedItem_13 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_14 
WHERE 
	UserDefined_14_id IN
	( 
		SELECT 
			UserDefined_14_id
		FROM 
			UserDefined_14 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_14/row') WITH UserDefined_14 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_14 
WHERE 
	UserDefinedItem_14_id IN
	( 
		SELECT 
			UserDefinedItem_14_id
		FROM 
			UserDefinedItem_14 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_14/row') WITH UserDefinedItem_14 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_15 
WHERE 
	UserDefined_15_id IN
	( 
		SELECT 
			UserDefined_15_id
		FROM 
			UserDefined_15 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_15/row') WITH UserDefined_15 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_15 
WHERE 
	UserDefinedItem_15_id IN
	( 
		SELECT 
			UserDefinedItem_15_id
		FROM 
			UserDefinedItem_15 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_15/row') WITH UserDefinedItem_15 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_16 
WHERE 
	UserDefined_16_id IN
	( 
		SELECT 
			UserDefined_16_id
		FROM 
			UserDefined_16 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_16/row') WITH UserDefined_16 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_16 
WHERE 
	UserDefinedItem_16_id IN
	( 
		SELECT 
			UserDefinedItem_16_id
		FROM 
			UserDefinedItem_16 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_16/row') WITH UserDefinedItem_16 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_17 
WHERE 
	UserDefined_17_id IN
	( 
		SELECT 
			UserDefined_17_id
		FROM 
			UserDefined_17 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_17/row') WITH UserDefined_17 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_17 
WHERE 
	UserDefinedItem_17_id IN
	( 
		SELECT 
			UserDefinedItem_17_id
		FROM 
			UserDefinedItem_17 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_17/row') WITH UserDefinedItem_17 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_18 
WHERE 
	UserDefined_18_id IN
	( 
		SELECT 
			UserDefined_18_id
		FROM 
			UserDefined_18 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_18/row') WITH UserDefined_18 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_18 
WHERE 
	UserDefinedItem_18_id IN
	( 
		SELECT 
			UserDefinedItem_18_id
		FROM 
			UserDefinedItem_18 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_18/row') WITH UserDefinedItem_18 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_19 
WHERE 
	UserDefined_19_id IN
	( 
		SELECT 
			UserDefined_19_id
		FROM 
			UserDefined_19 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_19/row') WITH UserDefined_19 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_19 
WHERE 
	UserDefinedItem_19_id IN
	( 
		SELECT 
			UserDefinedItem_19_id
		FROM 
			UserDefinedItem_19 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_19/row') WITH UserDefinedItem_19 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_20 
WHERE 
	UserDefined_20_id IN
	( 
		SELECT 
			UserDefined_20_id
		FROM 
			UserDefined_20 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_20/row') WITH UserDefined_20 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_20 
WHERE 
	UserDefinedItem_20_id IN
	( 
		SELECT 
			UserDefinedItem_20_id
		FROM 
			UserDefinedItem_20 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_20/row') WITH UserDefinedItem_20 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_21 
WHERE 
	UserDefined_21_id IN
	( 
		SELECT 
			UserDefined_21_id
		FROM 
			UserDefined_21 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_21/row') WITH UserDefined_21 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_21 
WHERE 
	UserDefinedItem_21_id IN
	( 
		SELECT 
			UserDefinedItem_21_id
		FROM 
			UserDefinedItem_21 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_21/row') WITH UserDefinedItem_21 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_22 
WHERE 
	UserDefined_22_id IN
	( 
		SELECT 
			UserDefined_22_id
		FROM 
			UserDefined_22 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_22/row') WITH UserDefined_22 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_22 
WHERE 
	UserDefinedItem_22_id IN
	( 
		SELECT 
			UserDefinedItem_22_id
		FROM 
			UserDefinedItem_22 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_22/row') WITH UserDefinedItem_22 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_23 
WHERE 
	UserDefined_23_id IN
	( 
		SELECT 
			UserDefined_23_id
		FROM 
			UserDefined_23 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_23/row') WITH UserDefined_23 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_23 
WHERE 
	UserDefinedItem_23_id IN
	( 
		SELECT 
			UserDefinedItem_23_id
		FROM 
			UserDefinedItem_23 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_23/row') WITH UserDefinedItem_23 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_24 
WHERE 
	UserDefined_24_id IN
	( 
		SELECT 
			UserDefined_24_id
		FROM 
			UserDefined_24 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_24/row') WITH UserDefined_24 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_24 
WHERE 
	UserDefinedItem_24_id IN
	( 
		SELECT 
			UserDefinedItem_24_id
		FROM 
			UserDefinedItem_24 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_24/row') WITH UserDefinedItem_24 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_25 
WHERE 
	UserDefined_25_id IN
	( 
		SELECT 
			UserDefined_25_id
		FROM 
			UserDefined_25 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_25/row') WITH UserDefined_25 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_25 
WHERE 
	UserDefinedItem_25_id IN
	( 
		SELECT 
			UserDefinedItem_25_id
		FROM 
			UserDefinedItem_25 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_25/row') WITH UserDefinedItem_25 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_26 
WHERE 
	UserDefined_26_id IN
	( 
		SELECT 
			UserDefined_26_id
		FROM 
			UserDefined_26 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_26/row') WITH UserDefined_26 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_26 
WHERE 
	UserDefinedItem_26_id IN
	( 
		SELECT 
			UserDefinedItem_26_id
		FROM 
			UserDefinedItem_26 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_26/row') WITH UserDefinedItem_26 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_27 
WHERE 
	UserDefined_27_id IN
	( 
		SELECT 
			UserDefined_27_id
		FROM 
			UserDefined_27 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_27/row') WITH UserDefined_27 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_27 
WHERE 
	UserDefinedItem_27_id IN
	( 
		SELECT 
			UserDefinedItem_27_id
		FROM 
			UserDefinedItem_27 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_27/row') WITH UserDefinedItem_27 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_28 
WHERE 
	UserDefined_28_id IN
	( 
		SELECT 
			UserDefined_28_id
		FROM 
			UserDefined_28 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_28/row') WITH UserDefined_28 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_28 
WHERE 
	UserDefinedItem_28_id IN
	( 
		SELECT 
			UserDefinedItem_28_id
		FROM 
			UserDefinedItem_28 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_28/row') WITH UserDefinedItem_28 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_29 
WHERE 
	UserDefined_29_id IN
	( 
		SELECT 
			UserDefined_29_id
		FROM 
			UserDefined_29 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_29/row') WITH UserDefined_29 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_29 
WHERE 
	UserDefinedItem_29_id IN
	( 
		SELECT 
			UserDefinedItem_29_id
		FROM 
			UserDefinedItem_29 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_29/row') WITH UserDefinedItem_29 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_30 
WHERE 
	UserDefined_30_id IN
	( 
		SELECT 
			UserDefined_30_id
		FROM 
			UserDefined_30 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_30/row') WITH UserDefined_30 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_30 
WHERE 
	UserDefinedItem_30_id IN
	( 
		SELECT 
			UserDefinedItem_30_id
		FROM 
			UserDefinedItem_30 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_30/row') WITH UserDefinedItem_30 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_31 
WHERE 
	UserDefined_31_id IN
	( 
		SELECT 
			UserDefined_31_id
		FROM 
			UserDefined_31 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_31/row') WITH UserDefined_31 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_31 
WHERE 
	UserDefinedItem_31_id IN
	( 
		SELECT 
			UserDefinedItem_31_id
		FROM 
			UserDefinedItem_31 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_31/row') WITH UserDefinedItem_31 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_32 
WHERE 
	UserDefined_32_id IN
	( 
		SELECT 
			UserDefined_32_id
		FROM 
			UserDefined_32 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_32/row') WITH UserDefined_32 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_32 
WHERE 
	UserDefinedItem_32_id IN
	( 
		SELECT 
			UserDefinedItem_32_id
		FROM 
			UserDefinedItem_32 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_32/row') WITH UserDefinedItem_32 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_33 
WHERE 
	UserDefined_33_id IN
	( 
		SELECT 
			UserDefined_33_id
		FROM 
			UserDefined_33 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_33/row') WITH UserDefined_33 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_33 
WHERE 
	UserDefinedItem_33_id IN
	( 
		SELECT 
			UserDefinedItem_33_id
		FROM 
			UserDefinedItem_33 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_33/row') WITH UserDefinedItem_33 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_34 
WHERE 
	UserDefined_34_id IN
	( 
		SELECT 
			UserDefined_34_id
		FROM 
			UserDefined_34 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_34/row') WITH UserDefined_34 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_34 
WHERE 
	UserDefinedItem_34_id IN
	( 
		SELECT 
			UserDefinedItem_34_id
		FROM 
			UserDefinedItem_34 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_34/row') WITH UserDefinedItem_34 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_35 
WHERE 
	UserDefined_35_id IN
	( 
		SELECT 
			UserDefined_35_id
		FROM 
			UserDefined_35 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_35/row') WITH UserDefined_35 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_35 
WHERE 
	UserDefinedItem_35_id IN
	( 
		SELECT 
			UserDefinedItem_35_id
		FROM 
			UserDefinedItem_35 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_35/row') WITH UserDefinedItem_35 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_36 
WHERE 
	UserDefined_36_id IN
	( 
		SELECT 
			UserDefined_36_id
		FROM 
			UserDefined_36 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_36/row') WITH UserDefined_36 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_36 
WHERE 
	UserDefinedItem_36_id IN
	( 
		SELECT 
			UserDefinedItem_36_id
		FROM 
			UserDefinedItem_36 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_36/row') WITH UserDefinedItem_36 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_37 
WHERE 
	UserDefined_37_id IN
	( 
		SELECT 
			UserDefined_37_id
		FROM 
			UserDefined_37 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_37/row') WITH UserDefined_37 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_37 
WHERE 
	UserDefinedItem_37_id IN
	( 
		SELECT 
			UserDefinedItem_37_id
		FROM 
			UserDefinedItem_37 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_37/row') WITH UserDefinedItem_37 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_38 
WHERE 
	UserDefined_38_id IN
	( 
		SELECT 
			UserDefined_38_id
		FROM 
			UserDefined_38 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_38/row') WITH UserDefined_38 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_38 
WHERE 
	UserDefinedItem_38_id IN
	( 
		SELECT 
			UserDefinedItem_38_id
		FROM 
			UserDefinedItem_38 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_38/row') WITH UserDefinedItem_38 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_39 
WHERE 
	UserDefined_39_id IN
	( 
		SELECT 
			UserDefined_39_id
		FROM 
			UserDefined_39 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_39/row') WITH UserDefined_39 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_39 
WHERE 
	UserDefinedItem_39_id IN
	( 
		SELECT 
			UserDefinedItem_39_id
		FROM 
			UserDefinedItem_39 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_39/row') WITH UserDefinedItem_39 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_40 
WHERE 
	UserDefined_40_id IN
	( 
		SELECT 
			UserDefined_40_id
		FROM 
			UserDefined_40 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_40/row') WITH UserDefined_40 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_40 
WHERE 
	UserDefinedItem_40_id IN
	( 
		SELECT 
			UserDefinedItem_40_id
		FROM 
			UserDefinedItem_40 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_40/row') WITH UserDefinedItem_40 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_41 
WHERE 
	UserDefined_41_id IN
	( 
		SELECT 
			UserDefined_41_id
		FROM 
			UserDefined_41 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_41/row') WITH UserDefined_41 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_41 
WHERE 
	UserDefinedItem_41_id IN
	( 
		SELECT 
			UserDefinedItem_41_id
		FROM 
			UserDefinedItem_41 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_41/row') WITH UserDefinedItem_41 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_42 
WHERE 
	UserDefined_42_id IN
	( 
		SELECT 
			UserDefined_42_id
		FROM 
			UserDefined_42 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_42/row') WITH UserDefined_42 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_42 
WHERE 
	UserDefinedItem_42_id IN
	( 
		SELECT 
			UserDefinedItem_42_id
		FROM 
			UserDefinedItem_42 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_42/row') WITH UserDefinedItem_42 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_43 
WHERE 
	UserDefined_43_id IN
	( 
		SELECT 
			UserDefined_43_id
		FROM 
			UserDefined_43 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_43/row') WITH UserDefined_43 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_43 
WHERE 
	UserDefinedItem_43_id IN
	( 
		SELECT 
			UserDefinedItem_43_id
		FROM 
			UserDefinedItem_43 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_43/row') WITH UserDefinedItem_43 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_44 
WHERE 
	UserDefined_44_id IN
	( 
		SELECT 
			UserDefined_44_id
		FROM 
			UserDefined_44 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_44/row') WITH UserDefined_44 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_44 
WHERE 
	UserDefinedItem_44_id IN
	( 
		SELECT 
			UserDefinedItem_44_id
		FROM 
			UserDefinedItem_44 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_44/row') WITH UserDefinedItem_44 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_45 
WHERE 
	UserDefined_45_id IN
	( 
		SELECT 
			UserDefined_45_id
		FROM 
			UserDefined_45 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_45/row') WITH UserDefined_45 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_45 
WHERE 
	UserDefinedItem_45_id IN
	( 
		SELECT 
			UserDefinedItem_45_id
		FROM 
			UserDefinedItem_45 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_45/row') WITH UserDefinedItem_45 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_46 
WHERE 
	UserDefined_46_id IN
	( 
		SELECT 
			UserDefined_46_id
		FROM 
			UserDefined_46 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_46/row') WITH UserDefined_46 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_46 
WHERE 
	UserDefinedItem_46_id IN
	( 
		SELECT 
			UserDefinedItem_46_id
		FROM 
			UserDefinedItem_46 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_46/row') WITH UserDefinedItem_46 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_47 
WHERE 
	UserDefined_47_id IN
	( 
		SELECT 
			UserDefined_47_id
		FROM 
			UserDefined_47 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_47/row') WITH UserDefined_47 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_47 
WHERE 
	UserDefinedItem_47_id IN
	( 
		SELECT 
			UserDefinedItem_47_id
		FROM 
			UserDefinedItem_47 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_47/row') WITH UserDefinedItem_47 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_48 
WHERE 
	UserDefined_48_id IN
	( 
		SELECT 
			UserDefined_48_id
		FROM 
			UserDefined_48 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_48/row') WITH UserDefined_48 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_48 
WHERE 
	UserDefinedItem_48_id IN
	( 
		SELECT 
			UserDefinedItem_48_id
		FROM 
			UserDefinedItem_48 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_48/row') WITH UserDefinedItem_48 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_49 
WHERE 
	UserDefined_49_id IN
	( 
		SELECT 
			UserDefined_49_id
		FROM 
			UserDefined_49 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_49/row') WITH UserDefined_49 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_49 
WHERE 
	UserDefinedItem_49_id IN
	( 
		SELECT 
			UserDefinedItem_49_id
		FROM 
			UserDefinedItem_49 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_49/row') WITH UserDefinedItem_49 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefined_50 
WHERE 
	UserDefined_50_id IN
	( 
		SELECT 
			UserDefined_50_id
		FROM 
			UserDefined_50 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefined_50/row') WITH UserDefined_50 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	UserDefinedItem_50 
WHERE 
	UserDefinedItem_50_id IN
	( 
		SELECT 
			UserDefinedItem_50_id
		FROM 
			UserDefinedItem_50 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/UserDefinedItem_50/row') WITH UserDefinedItem_50 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	JobCustom_1 
WHERE 
	JobCustom_1_id IN
	( 
		SELECT 
			JobCustom_1_id
		FROM 
			JobCustom_1 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustom_1/row') WITH JobCustom_1 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustomItem_1 
WHERE 
	JobCustomItem_1_id IN
	( 
		SELECT 
			JobCustomItem_1_id
		FROM 
			JobCustomItem_1 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustomItem_1/row') WITH JobCustomItem_1 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustom_2 
WHERE 
	JobCustom_2_id IN
	( 
		SELECT 
			JobCustom_2_id
		FROM 
			JobCustom_2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustom_2/row') WITH JobCustom_2 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustomItem_2 
WHERE 
	JobCustomItem_2_id IN
	( 
		SELECT 
			JobCustomItem_2_id
		FROM 
			JobCustomItem_2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustomItem_2/row') WITH JobCustomItem_2 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustom_3 
WHERE 
	JobCustom_3_id IN
	( 
		SELECT 
			JobCustom_3_id
		FROM 
			JobCustom_3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustom_3/row') WITH JobCustom_3 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustomItem_3 
WHERE 
	JobCustomItem_3_id IN
	( 
		SELECT 
			JobCustomItem_3_id
		FROM 
			JobCustomItem_3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustomItem_3/row') WITH JobCustomItem_3 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustom_4 
WHERE 
	JobCustom_4_id IN
	( 
		SELECT 
			JobCustom_4_id
		FROM 
			JobCustom_4 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustom_4/row') WITH JobCustom_4 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustomItem_4 
WHERE 
	JobCustomItem_4_id IN
	( 
		SELECT 
			JobCustomItem_4_id
		FROM 
			JobCustomItem_4 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustomItem_4/row') WITH JobCustomItem_4 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustom_5 
WHERE 
	JobCustom_5_id IN
	( 
		SELECT 
			JobCustom_5_id
		FROM 
			JobCustom_5 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustom_5/row') WITH JobCustom_5 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	JobCustomItem_5 
WHERE 
	JobCustomItem_5_id IN
	( 
		SELECT 
			JobCustomItem_5_id
		FROM 
			JobCustomItem_5 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/JobCustomItem_5/row') WITH JobCustomItem_5 x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	MudCheck_1 
WHERE 
	MudCheck_1_id IN
	( 
		SELECT 
			MudCheck_1_id
		FROM 
			MudCheck_1 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudCheck_1/row') WITH MudCheck_1 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudCheck_2 
WHERE 
	MudCheck_2_id IN
	( 
		SELECT 
			MudCheck_2_id
		FROM 
			MudCheck_2 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudCheck_2/row') WITH MudCheck_2 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudCheck_3 
WHERE 
	MudCheck_3_id IN
	( 
		SELECT 
			MudCheck_3_id
		FROM 
			MudCheck_3 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudCheck_3/row') WITH MudCheck_3 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudCheck_4 
WHERE 
	MudCheck_4_id IN
	( 
		SELECT 
			MudCheck_4_id
		FROM 
			MudCheck_4 a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudCheck_4/row') WITH MudCheck_4 x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudInventoryData 
WHERE 
	MudInventoryData_id IN
	( 
		SELECT 
			MudInventoryData_id
		FROM 
			MudInventoryData a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudInventoryData/row') WITH MudInventoryData x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudInventoryRepeatable 
WHERE 
	MudInventoryRepeatable_id IN
	( 
		SELECT 
			MudInventoryRepeatable_id
		FROM 
			MudInventoryRepeatable a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudInventoryRepeatable/row') WITH MudInventoryRepeatable x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	MudInventoryMaterialRepeatable 
WHERE 
	MudInventoryMaterialRepeatable_id IN
	( 
		SELECT 
			MudInventoryMaterialRepeatable_id
		FROM 
			MudInventoryMaterialRepeatable a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/MudInventoryMaterialRepeatable/row') WITH MudInventoryMaterialRepeatable x
          ON a.job_number = x.job_number
			AND a.report_Date = x.report_Date 
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
		LEFT JOIN DeletedDailyReports dr 
			ON a.job_number = dr.job_number 
			AND a.report_Date = dr.report_Date 
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      LEFT JOIN DeletedLocations l
            ON a.location_id = l.location_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
			OR dr.job_number IS NOT NULL 
          OR w.well_id IS NOT NULL
			OR l.location_id IS NOT NULL

        )

DELETE FROM 
	WFECasing 
WHERE 
	WFECasing_id IN
	( 
		SELECT 
			WFECasing_id
		FROM 
			WFECasing a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFECasing/row') WITH WFECasing x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFECasingRepeatable 
WHERE 
	WFECasingRepeatable_id IN
	( 
		SELECT 
			WFECasingRepeatable_id
		FROM 
			WFECasingRepeatable a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFECasingRepeatable/row') WITH WFECasingRepeatable x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEBha 
WHERE 
	WFEBha_id IN
	( 
		SELECT 
			WFEBha_id
		FROM 
			WFEBha a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEBha/row') WITH WFEBha x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

DELETE FROM 
	WFEBhaRepeatable 
WHERE 
	WFEBhaRepeatable_id IN
	( 
		SELECT 
			WFEBhaRepeatable_id
		FROM 
			WFEBhaRepeatable a 
		LEFT JOIN OPENXML(@hDoc, 'ROOT/WFEBhaRepeatable/row') WITH WFEBhaRepeatable x
          ON a.job_number = x.job_number
      LEFT JOIN DeletedJobs j
	    	ON a.job_number = j.job_number
      LEFT JOIN DeletedWells w
            ON a.well_id = w.well_id
      WHERE 
          x.job_number IS NOT NULL
            OR j.job_number IS NOT NULL
          OR w.well_id IS NOT NULL

        )

 
    -- The statements below insert data into the SQL tables
INSERT INTO UOM SELECT * FROM OPENXML(@hDoc, 'ROOT/UOM/row') WITH UOM
INSERT INTO CostVendor SELECT * FROM OPENXML(@hDoc, 'ROOT/CostVendor/row') WITH CostVendor
INSERT INTO AFE SELECT * FROM OPENXML(@hDoc, 'ROOT/AFE/row') WITH AFE
INSERT INTO AFEItems SELECT * FROM OPENXML(@hDoc, 'ROOT/AFEItems/row') WITH AFEItems
INSERT INTO DailyOps SELECT * FROM OPENXML(@hDoc, 'ROOT/DailyOps/row') WITH DailyOps
INSERT INTO DailyOps2 SELECT * FROM OPENXML(@hDoc, 'ROOT/DailyOps2/row') WITH DailyOps2
INSERT INTO DailyOps3 SELECT * FROM OPENXML(@hDoc, 'ROOT/DailyOps3/row') WITH DailyOps3
INSERT INTO TimeLog SELECT * FROM OPENXML(@hDoc, 'ROOT/TimeLog/row') WITH TimeLog
INSERT INTO TimeLogActivityItem SELECT * FROM OPENXML(@hDoc, 'ROOT/TimeLogActivityItem/row') WITH TimeLogActivityItem
INSERT INTO ActivityTimes SELECT * FROM OPENXML(@hDoc, 'ROOT/ActivityTimes/row') WITH ActivityTimes
INSERT INTO ActivityTimesItem SELECT * FROM OPENXML(@hDoc, 'ROOT/ActivityTimesItem/row') WITH ActivityTimesItem
INSERT INTO BHA SELECT * FROM OPENXML(@hDoc, 'ROOT/BHA/row') WITH BHA
INSERT INTO BHAItem SELECT * FROM OPENXML(@hDoc, 'ROOT/BHAItem/row') WITH BHAItem
INSERT INTO WFEBOP SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEBOP/row') WITH WFEBOP
INSERT INTO Casing SELECT * FROM OPENXML(@hDoc, 'ROOT/Casing/row') WITH Casing
INSERT INTO CasingItem SELECT * FROM OPENXML(@hDoc, 'ROOT/CasingItem/row') WITH CasingItem
INSERT INTO Tubing SELECT * FROM OPENXML(@hDoc, 'ROOT/Tubing/row') WITH Tubing
INSERT INTO TubingItem SELECT * FROM OPENXML(@hDoc, 'ROOT/TubingItem/row') WITH TubingItem
INSERT INTO DrillingCost SELECT * FROM OPENXML(@hDoc, 'ROOT/DrillingCost/row') WITH DrillingCost
INSERT INTO DrillingCostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/DrillingCostItem/row') WITH DrillingCostItem
INSERT INTO DrillingCostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/DrillingCostContingency/row') WITH DrillingCostContingency
INSERT INTO CompletionCost SELECT * FROM OPENXML(@hDoc, 'ROOT/CompletionCost/row') WITH CompletionCost
INSERT INTO CompletionCostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/CompletionCostItem/row') WITH CompletionCostItem
INSERT INTO CompletionCostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/CompletionCostContingency/row') WITH CompletionCostContingency
INSERT INTO WorkoverCost SELECT * FROM OPENXML(@hDoc, 'ROOT/WorkoverCost/row') WITH WorkoverCost
INSERT INTO WorkoverCostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WorkoverCostItem/row') WITH WorkoverCostItem
INSERT INTO WorkoverCostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/WorkoverCostContingency/row') WITH WorkoverCostContingency
INSERT INTO FacilitiesCost SELECT * FROM OPENXML(@hDoc, 'ROOT/FacilitiesCost/row') WITH FacilitiesCost
INSERT INTO FacilitiesCostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/FacilitiesCostItem/row') WITH FacilitiesCostItem
INSERT INTO FacilitiesCostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/FacilitiesCostContingency/row') WITH FacilitiesCostContingency
INSERT INTO ProductionCost SELECT * FROM OPENXML(@hDoc, 'ROOT/ProductionCost/row') WITH ProductionCost
INSERT INTO ProductionCostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/ProductionCostItem/row') WITH ProductionCostItem
INSERT INTO ProductionCostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/ProductionCostContingency/row') WITH ProductionCostContingency
INSERT INTO LOECost SELECT * FROM OPENXML(@hDoc, 'ROOT/LOECost/row') WITH LOECost
INSERT INTO LOECostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/LOECostItem/row') WITH LOECostItem
INSERT INTO LOECostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/LOECostContingency/row') WITH LOECostContingency
INSERT INTO NonAFECost SELECT * FROM OPENXML(@hDoc, 'ROOT/NonAFECost/row') WITH NonAFECost
INSERT INTO NonAFECostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/NonAFECostItem/row') WITH NonAFECostItem
INSERT INTO NonAFECostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/NonAFECostContingency/row') WITH NonAFECostContingency
INSERT INTO Custom1Cost SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom1Cost/row') WITH Custom1Cost
INSERT INTO Custom1CostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom1CostItem/row') WITH Custom1CostItem
INSERT INTO Custom1CostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom1CostContingency/row') WITH Custom1CostContingency
INSERT INTO Custom2Cost SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom2Cost/row') WITH Custom2Cost
INSERT INTO Custom2CostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom2CostItem/row') WITH Custom2CostItem
INSERT INTO Custom2CostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom2CostContingency/row') WITH Custom2CostContingency
INSERT INTO Custom3Cost SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom3Cost/row') WITH Custom3Cost
INSERT INTO Custom3CostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom3CostItem/row') WITH Custom3CostItem
INSERT INTO Custom3CostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom3CostContingency/row') WITH Custom3CostContingency
INSERT INTO Custom4Cost SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom4Cost/row') WITH Custom4Cost
INSERT INTO Custom4CostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom4CostItem/row') WITH Custom4CostItem
INSERT INTO Custom4CostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom4CostContingency/row') WITH Custom4CostContingency
INSERT INTO Custom5Cost SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom5Cost/row') WITH Custom5Cost
INSERT INTO Custom5CostItem SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom5CostItem/row') WITH Custom5CostItem
INSERT INTO Custom5CostContingency SELECT * FROM OPENXML(@hDoc, 'ROOT/Custom5CostContingency/row') WITH Custom5CostContingency
INSERT INTO CostAllocation SELECT * FROM OPENXML(@hDoc, 'ROOT/CostAllocation/row') WITH CostAllocation
INSERT INTO CostAllocationItem SELECT * FROM OPENXML(@hDoc, 'ROOT/CostAllocationItem/row') WITH CostAllocationItem
INSERT INTO WFEConsumables SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEConsumables/row') WITH WFEConsumables
INSERT INTO WFEConsumableItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEConsumableItem/row') WITH WFEConsumableItem
INSERT INTO WFETransport SELECT * FROM OPENXML(@hDoc, 'ROOT/WFETransport/row') WITH WFETransport
INSERT INTO WFETransportVessel SELECT * FROM OPENXML(@hDoc, 'ROOT/WFETransportVessel/row') WITH WFETransportVessel
INSERT INTO WFETransportHelicopter SELECT * FROM OPENXML(@hDoc, 'ROOT/WFETransportHelicopter/row') WITH WFETransportHelicopter
INSERT INTO Survey SELECT * FROM OPENXML(@hDoc, 'ROOT/Survey/row') WITH Survey
INSERT INTO SurveyItem SELECT * FROM OPENXML(@hDoc, 'ROOT/SurveyItem/row') WITH SurveyItem
INSERT INTO WFEPerforation SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEPerforation/row') WITH WFEPerforation
INSERT INTO WFEPerforationItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEPerforationItem/row') WITH WFEPerforationItem
INSERT INTO Flowback SELECT * FROM OPENXML(@hDoc, 'ROOT/Flowback/row') WITH Flowback
INSERT INTO FlowbackItem SELECT * FROM OPENXML(@hDoc, 'ROOT/FlowbackItem/row') WITH FlowbackItem
INSERT INTO WellInfo SELECT * FROM OPENXML(@hDoc, 'ROOT/WellInfo/row') WITH WellInfo
INSERT INTO LocationInfo SELECT * FROM OPENXML(@hDoc, 'ROOT/LocationInfo/row') WITH LocationInfo
INSERT INTO WkgInterest SELECT * FROM OPENXML(@hDoc, 'ROOT/WkgInterest/row') WITH WkgInterest
INSERT INTO WkgInterestItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WkgInterestItem/row') WITH WkgInterestItem
INSERT INTO JobDetails SELECT * FROM OPENXML(@hDoc, 'ROOT/JobDetails/row') WITH JobDetails
INSERT INTO DatumPoints SELECT * FROM OPENXML(@hDoc, 'ROOT/DatumPoints/row') WITH DatumPoints
INSERT INTO WFERigElevation SELECT * FROM OPENXML(@hDoc, 'ROOT/WFERigElevation/row') WITH WFERigElevation
INSERT INTO Environmental SELECT * FROM OPENXML(@hDoc, 'ROOT/Environmental/row') WITH Environmental
INSERT INTO Pumps SELECT * FROM OPENXML(@hDoc, 'ROOT/Pumps/row') WITH Pumps
INSERT INTO PumpItems SELECT * FROM OPENXML(@hDoc, 'ROOT/PumpItems/row') WITH PumpItems
INSERT INTO Packers SELECT * FROM OPENXML(@hDoc, 'ROOT/Packers/row') WITH Packers
INSERT INTO PackerItem SELECT * FROM OPENXML(@hDoc, 'ROOT/PackerItem/row') WITH PackerItem
INSERT INTO DrillBreak SELECT * FROM OPENXML(@hDoc, 'ROOT/DrillBreak/row') WITH DrillBreak
INSERT INTO DrillBreakItem SELECT * FROM OPENXML(@hDoc, 'ROOT/DrillBreakItem/row') WITH DrillBreakItem
INSERT INTO Weather SELECT * FROM OPENXML(@hDoc, 'ROOT/Weather/row') WITH Weather
INSERT INTO Solids SELECT * FROM OPENXML(@hDoc, 'ROOT/Solids/row') WITH Solids
INSERT INTO Cementing SELECT * FROM OPENXML(@hDoc, 'ROOT/Cementing/row') WITH Cementing
INSERT INTO CementingItem SELECT * FROM OPENXML(@hDoc, 'ROOT/CementingItem/row') WITH CementingItem
INSERT INTO CompletionFluid SELECT * FROM OPENXML(@hDoc, 'ROOT/CompletionFluid/row') WITH CompletionFluid
INSERT INTO WFEDrillBit SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEDrillBit/row') WITH WFEDrillBit
INSERT INTO WFEDrillBitItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEDrillBitItem/row') WITH WFEDrillBitItem
INSERT INTO Personnel SELECT * FROM OPENXML(@hDoc, 'ROOT/Personnel/row') WITH Personnel
INSERT INTO PersonnelItem SELECT * FROM OPENXML(@hDoc, 'ROOT/PersonnelItem/row') WITH PersonnelItem
INSERT INTO WFEWellPlan SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEWellPlan/row') WITH WFEWellPlan
INSERT INTO WFEWellPlanItem SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEWellPlanItem/row') WITH WFEWellPlanItem
INSERT INTO UserDefined_1 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_1/row') WITH UserDefined_1
INSERT INTO UserDefinedItem_1 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_1/row') WITH UserDefinedItem_1
INSERT INTO UserDefined_2 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_2/row') WITH UserDefined_2
INSERT INTO UserDefinedItem_2 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_2/row') WITH UserDefinedItem_2
INSERT INTO UserDefined_3 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_3/row') WITH UserDefined_3
INSERT INTO UserDefinedItem_3 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_3/row') WITH UserDefinedItem_3
INSERT INTO UserDefined_4 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_4/row') WITH UserDefined_4
INSERT INTO UserDefinedItem_4 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_4/row') WITH UserDefinedItem_4
INSERT INTO UserDefined_5 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_5/row') WITH UserDefined_5
INSERT INTO UserDefinedItem_5 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_5/row') WITH UserDefinedItem_5
INSERT INTO UserDefined_6 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_6/row') WITH UserDefined_6
INSERT INTO UserDefinedItem_6 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_6/row') WITH UserDefinedItem_6
INSERT INTO UserDefined_7 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_7/row') WITH UserDefined_7
INSERT INTO UserDefinedItem_7 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_7/row') WITH UserDefinedItem_7
INSERT INTO UserDefined_8 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_8/row') WITH UserDefined_8
INSERT INTO UserDefinedItem_8 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_8/row') WITH UserDefinedItem_8
INSERT INTO UserDefined_9 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_9/row') WITH UserDefined_9
INSERT INTO UserDefinedItem_9 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_9/row') WITH UserDefinedItem_9
INSERT INTO UserDefined_10 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_10/row') WITH UserDefined_10
INSERT INTO UserDefinedItem_10 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_10/row') WITH UserDefinedItem_10
INSERT INTO UserDefined_11 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_11/row') WITH UserDefined_11
INSERT INTO UserDefinedItem_11 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_11/row') WITH UserDefinedItem_11
INSERT INTO UserDefined_12 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_12/row') WITH UserDefined_12
INSERT INTO UserDefinedItem_12 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_12/row') WITH UserDefinedItem_12
INSERT INTO UserDefined_13 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_13/row') WITH UserDefined_13
INSERT INTO UserDefinedItem_13 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_13/row') WITH UserDefinedItem_13
INSERT INTO UserDefined_14 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_14/row') WITH UserDefined_14
INSERT INTO UserDefinedItem_14 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_14/row') WITH UserDefinedItem_14
INSERT INTO UserDefined_15 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_15/row') WITH UserDefined_15
INSERT INTO UserDefinedItem_15 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_15/row') WITH UserDefinedItem_15
INSERT INTO UserDefined_16 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_16/row') WITH UserDefined_16
INSERT INTO UserDefinedItem_16 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_16/row') WITH UserDefinedItem_16
INSERT INTO UserDefined_17 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_17/row') WITH UserDefined_17
INSERT INTO UserDefinedItem_17 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_17/row') WITH UserDefinedItem_17
INSERT INTO UserDefined_18 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_18/row') WITH UserDefined_18
INSERT INTO UserDefinedItem_18 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_18/row') WITH UserDefinedItem_18
INSERT INTO UserDefined_19 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_19/row') WITH UserDefined_19
INSERT INTO UserDefinedItem_19 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_19/row') WITH UserDefinedItem_19
INSERT INTO UserDefined_20 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_20/row') WITH UserDefined_20
INSERT INTO UserDefinedItem_20 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_20/row') WITH UserDefinedItem_20
INSERT INTO UserDefined_21 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_21/row') WITH UserDefined_21
INSERT INTO UserDefinedItem_21 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_21/row') WITH UserDefinedItem_21
INSERT INTO UserDefined_22 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_22/row') WITH UserDefined_22
INSERT INTO UserDefinedItem_22 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_22/row') WITH UserDefinedItem_22
INSERT INTO UserDefined_23 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_23/row') WITH UserDefined_23
INSERT INTO UserDefinedItem_23 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_23/row') WITH UserDefinedItem_23
INSERT INTO UserDefined_24 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_24/row') WITH UserDefined_24
INSERT INTO UserDefinedItem_24 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_24/row') WITH UserDefinedItem_24
INSERT INTO UserDefined_25 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_25/row') WITH UserDefined_25
INSERT INTO UserDefinedItem_25 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_25/row') WITH UserDefinedItem_25
INSERT INTO UserDefined_26 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_26/row') WITH UserDefined_26
INSERT INTO UserDefinedItem_26 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_26/row') WITH UserDefinedItem_26
INSERT INTO UserDefined_27 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_27/row') WITH UserDefined_27
INSERT INTO UserDefinedItem_27 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_27/row') WITH UserDefinedItem_27
INSERT INTO UserDefined_28 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_28/row') WITH UserDefined_28
INSERT INTO UserDefinedItem_28 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_28/row') WITH UserDefinedItem_28
INSERT INTO UserDefined_29 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_29/row') WITH UserDefined_29
INSERT INTO UserDefinedItem_29 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_29/row') WITH UserDefinedItem_29
INSERT INTO UserDefined_30 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_30/row') WITH UserDefined_30
INSERT INTO UserDefinedItem_30 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_30/row') WITH UserDefinedItem_30
INSERT INTO UserDefined_31 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_31/row') WITH UserDefined_31
INSERT INTO UserDefinedItem_31 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_31/row') WITH UserDefinedItem_31
INSERT INTO UserDefined_32 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_32/row') WITH UserDefined_32
INSERT INTO UserDefinedItem_32 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_32/row') WITH UserDefinedItem_32
INSERT INTO UserDefined_33 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_33/row') WITH UserDefined_33
INSERT INTO UserDefinedItem_33 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_33/row') WITH UserDefinedItem_33
INSERT INTO UserDefined_34 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_34/row') WITH UserDefined_34
INSERT INTO UserDefinedItem_34 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_34/row') WITH UserDefinedItem_34
INSERT INTO UserDefined_35 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_35/row') WITH UserDefined_35
INSERT INTO UserDefinedItem_35 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_35/row') WITH UserDefinedItem_35
INSERT INTO UserDefined_36 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_36/row') WITH UserDefined_36
INSERT INTO UserDefinedItem_36 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_36/row') WITH UserDefinedItem_36
INSERT INTO UserDefined_37 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_37/row') WITH UserDefined_37
INSERT INTO UserDefinedItem_37 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_37/row') WITH UserDefinedItem_37
INSERT INTO UserDefined_38 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_38/row') WITH UserDefined_38
INSERT INTO UserDefinedItem_38 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_38/row') WITH UserDefinedItem_38
INSERT INTO UserDefined_39 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_39/row') WITH UserDefined_39
INSERT INTO UserDefinedItem_39 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_39/row') WITH UserDefinedItem_39
INSERT INTO UserDefined_40 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_40/row') WITH UserDefined_40
INSERT INTO UserDefinedItem_40 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_40/row') WITH UserDefinedItem_40
INSERT INTO UserDefined_41 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_41/row') WITH UserDefined_41
INSERT INTO UserDefinedItem_41 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_41/row') WITH UserDefinedItem_41
INSERT INTO UserDefined_42 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_42/row') WITH UserDefined_42
INSERT INTO UserDefinedItem_42 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_42/row') WITH UserDefinedItem_42
INSERT INTO UserDefined_43 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_43/row') WITH UserDefined_43
INSERT INTO UserDefinedItem_43 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_43/row') WITH UserDefinedItem_43
INSERT INTO UserDefined_44 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_44/row') WITH UserDefined_44
INSERT INTO UserDefinedItem_44 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_44/row') WITH UserDefinedItem_44
INSERT INTO UserDefined_45 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_45/row') WITH UserDefined_45
INSERT INTO UserDefinedItem_45 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_45/row') WITH UserDefinedItem_45
INSERT INTO UserDefined_46 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_46/row') WITH UserDefined_46
INSERT INTO UserDefinedItem_46 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_46/row') WITH UserDefinedItem_46
INSERT INTO UserDefined_47 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_47/row') WITH UserDefined_47
INSERT INTO UserDefinedItem_47 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_47/row') WITH UserDefinedItem_47
INSERT INTO UserDefined_48 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_48/row') WITH UserDefined_48
INSERT INTO UserDefinedItem_48 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_48/row') WITH UserDefinedItem_48
INSERT INTO UserDefined_49 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_49/row') WITH UserDefined_49
INSERT INTO UserDefinedItem_49 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_49/row') WITH UserDefinedItem_49
INSERT INTO UserDefined_50 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefined_50/row') WITH UserDefined_50
INSERT INTO UserDefinedItem_50 SELECT * FROM OPENXML(@hDoc, 'ROOT/UserDefinedItem_50/row') WITH UserDefinedItem_50
INSERT INTO JobCustom_1 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustom_1/row') WITH JobCustom_1
INSERT INTO JobCustomItem_1 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustomItem_1/row') WITH JobCustomItem_1
INSERT INTO JobCustom_2 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustom_2/row') WITH JobCustom_2
INSERT INTO JobCustomItem_2 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustomItem_2/row') WITH JobCustomItem_2
INSERT INTO JobCustom_3 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustom_3/row') WITH JobCustom_3
INSERT INTO JobCustomItem_3 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustomItem_3/row') WITH JobCustomItem_3
INSERT INTO JobCustom_4 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustom_4/row') WITH JobCustom_4
INSERT INTO JobCustomItem_4 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustomItem_4/row') WITH JobCustomItem_4
INSERT INTO JobCustom_5 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustom_5/row') WITH JobCustom_5
INSERT INTO JobCustomItem_5 SELECT * FROM OPENXML(@hDoc, 'ROOT/JobCustomItem_5/row') WITH JobCustomItem_5
INSERT INTO MudCheck_1 SELECT * FROM OPENXML(@hDoc, 'ROOT/MudCheck_1/row') WITH MudCheck_1
INSERT INTO MudCheck_2 SELECT * FROM OPENXML(@hDoc, 'ROOT/MudCheck_2/row') WITH MudCheck_2
INSERT INTO MudCheck_3 SELECT * FROM OPENXML(@hDoc, 'ROOT/MudCheck_3/row') WITH MudCheck_3
INSERT INTO MudCheck_4 SELECT * FROM OPENXML(@hDoc, 'ROOT/MudCheck_4/row') WITH MudCheck_4
INSERT INTO MudInventoryData SELECT * FROM OPENXML(@hDoc, 'ROOT/MudInventoryData/row') WITH MudInventoryData
INSERT INTO MudInventoryRepeatable SELECT * FROM OPENXML(@hDoc, 'ROOT/MudInventoryRepeatable/row') WITH MudInventoryRepeatable
INSERT INTO MudInventoryMaterialRepeatable SELECT * FROM OPENXML(@hDoc, 'ROOT/MudInventoryMaterialRepeatable/row') WITH MudInventoryMaterialRepeatable
INSERT INTO WFECasing SELECT * FROM OPENXML(@hDoc, 'ROOT/WFECasing/row') WITH WFECasing
INSERT INTO WFECasingRepeatable SELECT * FROM OPENXML(@hDoc, 'ROOT/WFECasingRepeatable/row') WITH WFECasingRepeatable
INSERT INTO WFEBha SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEBha/row') WITH WFEBha
INSERT INTO WFEBhaRepeatable SELECT * FROM OPENXML(@hDoc, 'ROOT/WFEBhaRepeatable/row') WITH WFEBhaRepeatable
 
 
    COMMIT TRANSACTION [Tran1]
 
END TRY 
BEGIN CATCH
    ROLLBACK TRANSACTION [Tran1] 
	--ERROR Occurred, Add error handling here
	SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END