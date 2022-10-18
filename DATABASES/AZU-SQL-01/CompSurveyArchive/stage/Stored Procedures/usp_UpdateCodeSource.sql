

CREATE PROC [stage].[usp_UpdateCodeSource] @Year varchar(4)
AS
BEGIN
-- add new records from StagingTable
INSERT INTO dbo.Code_Source
	(Source, TabName)
SELECT
	Stg.FileName, Stg.SheetName
FROM
	(
	SELECT DISTINCT
		FileName, SheetName
	FROM Stage.StagingTable
	) Stg
LEFT JOIN dbo.Code_Source Src
	ON Stg.FileName = Src.Source
	AND Stg.SheetName = Src.TabName
WHERE Src.Source IS NULL AND Src.TabName IS NULL

-- Add Codes based on Source and TabName. Note that order matters! Some updates override previous updates. 
-- Others may act as "default", filling in info that hasn't been updated by previous steps.

-- add PublisherCode
-- Mercer
update dbo.Code_Source set PublisherCode = 'ME' 
where 
	(TabName like '%_OW' 
	OR TabName like '%_IW') 
	AND YearCode is null
-- TW
update Code_Source set PublisherCode = 'TW' 
where 
	(source like '%WTWDS %' 
	OR source like '%TW %'
	OR TabName = 'Results')
	AND YearCode is null
-- Aon
update Code_Source set PublisherCode = 'AH' 
where 
	(source like '%Aon %' or source like '%Aon-')
	AND YearCode is null

-- add TypeCode
-- Mercer
update Code_Source set TypeCode = 'ENG' where Source like '%MTCS%' and PublisherCode = 'ME' and YearCode is null
update Code_Source set TypeCode = 'GEN' where TypeCode IS NULL and PublisherCode = 'ME' and YearCode is null
-- TW
update Code_Source set TypeCode = 'CHEM' where Source like '%Chemical Wage Survey%' or source like '%Chem Wage%' and PublisherCode = 'TW' and YearCode is null
update Code_Source set TypeCode = 'TECH' where Source like '%Technician Compensation Survey%' and PublisherCode = 'TW' and YearCode is null
update Code_Source set TypeCode = 'EXE' where Source like '% Exec %' and PublisherCode = 'TW' and YearCode is null
update Code_Source set TypeCode = 'ENG' where (Source like '% OAG %' or Source like '% O&G %') and PublisherCode = 'TW' and YearCode is null
update Code_Source set TypeCode = 'GEN' where TypeCode IS NULL and PublisherCode = 'TW' and YearCode is null
-- Aon
update Code_Source set TypeCode = 'BBE' where Source like '%Broad-Based Exempt%' and PublisherCode = 'AH' and YearCode is null
update Code_Source set TypeCode = 'EMT' where (Source like '%Energy Marketing and Trading%' OR Source like '% EMT %') and PublisherCode = 'AH' and YearCode is null
update Code_Source set TypeCode = 'NEX' where Source like '%Nonexempt%' and PublisherCode = 'AH' and YearCode is null
update Code_Source set TypeCode = 'ENG' where Source like '%Oil and Gas Industry%' and PublisherCode = 'AH' and YearCode is null
update Code_Source set TypeCode = 'EXE' where TypeCode IS NULL and PublisherCode = 'AH' and YearCode is null
-- add WeighCode
update Code_Source set WeightCode = 'OW' where Source like '%Organization-Weighted%' and YearCode is null
update Code_Source set WeightCode = 'IW' where Source like '%Incumbent-Weighted%' and YearCode is null
update Code_Source set WeightCode = 'OW' where Source like '%(OW)%' and YearCode is null
update Code_Source set WeightCode = 'IW' where Source like '%(IW)%' and YearCode is null
update Code_Source set WeightCode = 'OW' where Source like '%Company Weighted%' and YearCode is null
update Code_Source set WeightCode = 'IW' where Source like '%Incumbent Weighted%' and YearCode is null
update Code_Source set WeightCode = 'OW' where TabName = 'Company Weighted' and YearCode is null
update Code_Source set WeightCode = 'IW' where TabName = 'Incumbent Weighted' and YearCode is null
update Code_Source set WeightCode = 'OW' where TabName like '%_OW' and YearCode is null
update Code_Source set WeightCode = 'IW' where TabName like '%_IW' and YearCode is null
-- add EffectiveDate
UPDATE src
SET
	src.[Effective Date] = lfi.EffDate
FROM Code_Source as src
LEFT JOIN stage.LoadedFileInfo as lfi
	ON src.Source = lfi.FileName
	AND src.TabName = lfi.SheetName
WHERE src.YearCode IS NULL
-- add RegionCode
update Code_Source set RegionCode = 'REGION: NORTH CENTRAL' where (Source like '%North%' and Source like '%Central%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set RegionCode = 'REGION: NORTHEAST' where Source like '%Northeast%' and PublisherCode = 'ME' and  YearCode is null
update Code_Source set RegionCode = 'REGION: SOUTH CENTRAL' where (Source like '%South%' and Source like '%Central%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set RegionCode = 'REGION: SOUTHEAST' where Source like '%Southeast%' and PublisherCode = 'ME' and  YearCode is null
update Code_Source set RegionCode = 'REGION: WEST' where (Source like '%West%' and Source like '%Coast%') and PublisherCode = 'ME' and  YearCode is null
-- add DeptCode
update Code_Source set DeptCode = 'DEPT: ENG' where (Source like '%Engineering%' and Source like '%Design%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: EXEC' where Source like '%Executive%' and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: FIN_ACCTG_LEG' where (Source like '%Finance%' and Source like '%Accounting%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: HR' where (Source like '%Human%' and Source like '%Resources%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: IT' where (Source like '%Information%' and Source like '%Technology%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: LOG' where (Source like '%Logistics%' and Source like '%Supply%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: MANUFACT' where (Source like '%Manufacturing%' and Source like '%Operations%') and PublisherCode = 'ME' and  YearCode is null
update Code_Source set DeptCode = 'DEPT: MKT' where (Source like '%Sales%' and Source like '%Marketing%') and PublisherCode = 'ME' and  YearCode is null
-- add IndustryCode
update Code_Source set IndustryCode = 'SECTOR: NRG' where TypeCode = 'CHEM' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG MKT' where TypeCode = 'EMT' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG BENCHMARK' where (Source like '%Benchmark%' or Source like '%EGB%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG CROSS SEG' where (Source like '%MTCS%' and Source like '%EDR%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG FIELD' where (Source like '%MTCS%' and Source like '%EFD%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG DOWN' where (Source like '%MTCS%' and Source like '%EDS%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG MKT' where (Source like '%MTCS%' and Source like '%EET%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG UP/MID' where (Source like '%MTCS%' and Source like '%EUM%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG UTL' where (Source like '%MTCS%' and Source like '%EUT%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG CHEM' where (Source like '%MTCS%' and Source like '%ECH%') and TypeCode = 'ENG' and YearCode is null
update Code_Source set IndustryCode = 'SECTOR: NRG' where IndustryCode is NULL and TypeCode = 'ENG' and YearCode is null
-- add OrgCode
update Code_Source set OrgCode = 'ORG TYPE: FOR PROFIT' where (Source like '%For-Profit%' OR Source like '%For Profit%' OR Source like '%- F') and YearCode is null
update Code_Source set OrgCode = 'ORG TYPE: NON PROFIT' where Source like '%- NFP' and YearCode is null
-- finally, add YearCode
update Code_Source set YearCode = @Year where YearCode is null

END