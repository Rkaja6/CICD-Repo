




CREATE PROC [stage].[usp_UpdateColumnMapping] 
AS
BEGIN

TRUNCATE TABLE [stage].[ColumnMapping];

-- Initial Population of ColumnMapping. Need every combination so we can create select queries with dynamic SQL (to get the columns) and union them together.
INSERT INTO Stage.ColumnMapping
SELECT 
	L.FileName, L.SheetName, 'NULL' AS ColumnNumber, C.ColumnName, NULL AS PreviousColumnName
FROM [stage].[LoadedFileInfo] L
CROSS JOIN [dbo].[StandardColumns] C;

-- Job Title
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Job Title'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('PositionTitle'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Position Title','Job Title','2020 OGI Job Title'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Job Title','Title'))

-- Function
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Function'
WHERE 
	(src.PublisherCode = 'TW' AND src.TypeCode = 'CHEM' AND hdr.value in ('Function'))

-- Level
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Level'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Level','Career Level'))

-- Job Code
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Job Code'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('MjlCode'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Job Code','Pos. No.','2020 OGI Job Code'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Job Code', 'Family'))

-- Function Code
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Function Code'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Function Code'))

-- Level Code
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Level Code'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Level Code'))

-- Inc
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Inc'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_NumObs'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Annual Base Pay Number of Incumbents','Base Salary Number of Incumbents','Annual Base Number of Incumbents'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Base Salary #Incs','Base Salary #Incs', 'Annual Pay ($)  Incs','Base Salary # of Incs','Base Salary Incs', 'Annual Pay ($) #Incs'))

-- Cos
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Cos'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_NumOrgs'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Annual Base Pay Number of Companies','Base Salary Number of Companies','Annual Base Number of Companies'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Base Salary #Orgs','Base Salary #Orgs', 'Annual Pay ($)  Orgs','Base Salary # of Orgs','Base Salary Orgs', 'Annual Pay ($) #Orgs'))

-- Industry
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Industry'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Industry','Scope 1'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Industry','Industry Group'))

-- Corporate-Noncorporate
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Corporate-Noncorporate'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Unit Structure'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Corporate/Noncorporate'))

-- Rev Responsibility-Location-Other
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Rev Responsibility-Location-Other'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('MarketRefinement'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Scope','Geographic Location','Scope 2'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Gross Trading and Marketing Revenues','Incumbent Revenue Responsibility','Revenue','Global Revenue'))

-- Region
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Region'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Region'))

-- Sub Region
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Sub Region'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Sub Region'))

-- State
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'State'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('State'))

-- Metropolitan Area
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Metropolitan Area'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Metropolitan Area'))

-- Specialty
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Specialty'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Specialty'))

-- Type of Operations
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Type of Operations'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Type of Operations','Industry Group'))

-- Union Status
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Union Status'
WHERE 
	(src.PublisherCode = 'TW' AND hdr.value in ('Union Status'))

-- Family
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Family'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('Family'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Job Family','Position Family'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Function'))

-- Sub-Family
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Sub-Family'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('Sub-Family'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Job Sub-Family','Position Sub-Family'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Discipline'))

-- Specialization
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Specialization'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('Specialization'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Career Path','Position Career Path'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Commodity Code'))

-- Job Description
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Job Description'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Job Description'))

-- Mercer Job Type
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Mercer Job Type'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('MjlJobType'))

-- AonHewitt Scope From
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AonHewitt Scope From'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Scope From'))

-- AonHewitt Scope To
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AonHewitt Scope To'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Scope To'))

-- AonHewitt Scope Desc
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AonHewitt Scope Desc'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('Scope Description','Scope Criteria'))

-- Base 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Base 25th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_Perc25_IW','BaseAnnual_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Base Salary Low Quartile (25%)','Annual Base Pay Low Quartile (25%)','Annual Base Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Pay ($) 25th','Annual Base Salary 25th','Base Salary 25th', 'Annual Pay ($)  25th','Base Salary 25th ($000)'))

-- Base 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Base 50th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_Median_IW','BaseAnnual_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Base Salary Median (50%)','Annual Base Pay Median (50%)','Annual Base Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Pay ($) Median','Annual Pay ($) 50th','Annual Base Salary 50th','Base Salary 50th', 'Annual Pay ($)  Median','Base Salary Median ($000)','Base Salary Median'))

-- Base 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Base 75th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_Perc75_IW','BaseAnnual_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Base Salary High Quartile (75%)','Annual Base Pay High Quartile (75%)','Annual Base High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Pay ($) 75th','Annual Base Salary 75th','Base Salary 75th', 'Annual Pay ($)  75th','Base Salary 75th ($000)'))

-- Base 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Base 90th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('BaseAnnual_Perc90_IW','BaseAnnual_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Annual Base 90th Percentile (90%)','Base Salary 90th Percentile (90%)','Annual Base Pay 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Annual Pay ($) 90th','Annual Base Salary 90th','Base Salary 90th', 'Annual Pay ($)  90th','Base Salary 90th ($000)'))


-- Actual TC 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Actual TC 25th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationActuallessAllowancesMTCS_Perc25_IW','TotalCashCompensationActuallessAllowancesMTCS_Perc25_OW','TotalCashActual_Perc25_IW','TotalCashActual_Perc25_OW','TotalCashCompensationActuallessAllowances_Perc25_IW','TotalCashCompensationActuallessAllowances_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Total Cash Compensation Low Quartile (25%)','Total Cash (All Incumbents) Low Quartile (25%)','Annual Total Cash Low Quartile (25%)','Total Cash Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Cash Compensation 25th','Actual Total Annual Compensation 25th'))

-- Actual TC 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Actual TC 50th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationActuallessAllowancesMTCS_Median_IW','TotalCashCompensationActuallessAllowancesMTCS_Median_OW','TotalCashActual_Median_IW','TotalCashActual_Median_OW','TotalCashCompensationActuallessAllowances_Median_IW','TotalCashCompensationActuallessAllowances_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Total Cash Compensation Median (50%)','Total Cash (All Incumbents) Median (50%)','Annual Total Cash Median (50%)','Total Cash Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Cash Compensation 50th','Total Cash Compensation Median','Actual Total Annual Compensation 50th'))

-- Actual TC 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Actual TC 75th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationActuallessAllowancesMTCS_Perc75_IW','TotalCashCompensationActuallessAllowancesMTCS_Perc75_OW','TotalCashActual_Perc75_IW','TotalCashActual_Perc75_OW','TotalCashCompensationActuallessAllowances_Perc75_IW','TotalCashCompensationActuallessAllowances_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Total Cash Compensation High Quartile (75%)','Total Cash (All Incumbents) High Quartile (75%)','Annual Total Cash High Quartile (75%)','Total Cash High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Cash Compensation 75th','Actual Total Annual Compensation 75th'))

-- Actual TC 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Actual TC 90th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationActuallessAllowancesMTCS_Perc90_IW','TotalCashCompensationActuallessAllowancesMTCS_Perc90_OW','TotalCashActual_Perc90_IW','TotalCashActual_Perc90_OW','TotalCashCompensationActuallessAllowances_Perc90_IW','TotalCashCompensationActuallessAllowances_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Total Cash Compensation 90th Percentile (90%)','Total Cash (All Incumbents) 90th Percentile (90%)','Annual Total Cash 90th Percentile (90%)','Total Cash 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Cash Compensation 90th','Actual Total Annual Compensation 90th'))

-- Target TC 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TC 25th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationTargetlessAllowancesMTCS_Perc25_IW','TotalCashCompensationTargetlessAllowancesMTCS_Perc25_OW','TotalCashTarget_Perc25_IW','TotalCashTarget_Perc25_OW','TotalCashCompensationTargetlessAllowances_Perc25_IW','TotalCashCompensationTargetlessAllowances_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Total Cash Compensation Low Quartile (25%)','Target Total Cash (All Incumbents) Low Quartile (25%)','Annual Target Total Cash Low Quartile (25%)','Target Total Cash Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Target Cash Compensation 25th','Target Total Cash Compensation 25th','Target Total Annual Compensation 25th'))

-- Target TC 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TC 50th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationTargetlessAllowancesMTCS_Median_IW','TotalCashCompensationTargetlessAllowancesMTCS_Median_OW','TotalCashTarget_Median_IW','TotalCashTarget_Median_OW','TotalCashCompensationTargetlessAllowances_Median_IW','TotalCashCompensationTargetlessAllowances_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Total Cash Compensation Median (50%)','Target Total Cash (All Incumbents) Median (50%)','Annual Target Total Cash Median (50%)','Target Total Cash Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Target Cash Compensation Median','Target Total Cash Compensation Median','Target Total Cash Compensation 50th','Target Total Annual Compensation 50th'))

-- Target TC 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TC 75th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationTargetlessAllowancesMTCS_Perc75_IW','TotalCashCompensationTargetlessAllowancesMTCS_Perc75_OW','TotalCashTarget_Perc75_IW','TotalCashTarget_Perc75_OW','TotalCashCompensationTargetlessAllowances_Perc75_IW','TotalCashCompensationTargetlessAllowances_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Total Cash Compensation High Quartile (75%)','Target Total Cash (All Incumbents) High Quartile (75%)','Annual Target Total Cash High Quartile (75%)','Target Total Cash High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Target Cash Compensation 75th','Target Total Cash Compensation 75th','Target Total Annual Compensation 75th'))

-- Target TC 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TC 90th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalCashCompensationTargetlessAllowancesMTCS_Perc90_IW','TotalCashCompensationTargetlessAllowancesMTCS_Perc90_OW','TotalCashTarget_Perc90_IW','TotalCashTarget_Perc90_OW','TotalCashCompensationTargetlessAllowances_Perc90_IW','TotalCashCompensationTargetlessAllowances_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Total Cash Compensation 90th Percentile (90%)','Target Total Cash (All Incumbents) 90th Percentile (90%)','Annual Target Total Cash 90th Percentile (90%)','Target Total Cash 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Total Target Cash Compensation 90th','Target Total Cash Compensation 90th','Target Total Annual Compensation 90th'))

-- LTI 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI 25th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('LtiAmount_Perc25_IW','LtiAmount_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('LTI (FAS + Face Value) Low Quartile (25%)','LTI (All Incumbents) Low Quartile (25%)','Long-Term Incentives Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive 25th'))

-- LTI 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI 50th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('LtiAmount_Median_IW','LtiAmount_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('LTI (FAS + Face Value) Median (50%)','LTI (All Incumbents) Median (50%)','Long-Term Incentives Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive 50th'))

-- LTI 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI 75th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('LtiAmount_Perc75_IW','LtiAmount_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('LTI (FAS + Face Value) High Quartile (75%)','LTI (All Incumbents) High Quartile (75%)','Long-Term Incentives High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive 75th'))

-- LTI 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI 90th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('LtiAmount_Perc90_IW','LtiAmount_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('LTI (FAS + Face Value) 90th Percentile (90%)','LTI (All Incumbents) 90th Percentile (90%)','Long-Term Incentives 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive 90th'))

-- Total Direct Actual 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Total Direct Actual 25th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc25_IW','TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc25_OW','TotalDirectActual_Perc25_IW','TotalDirectActual_Perc25_OW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc25_IW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Net Total Compensation - LTI (FAS + Face Value) Low Quartile (25%)','Net Total Compensation (All Incumbents) Low Quartile (25%)','Total Compensation Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Actual Total Direct Compensation 25th'))

-- Total Direct Actual 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Total Direct Actual 50th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Median_IW','TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Median_OW','TotalDirectActual_Median_IW','TotalDirectActual_Median_OW','TotalDirectCompensationActuallessAllowancesBlackScholes_Median_IW','TotalDirectCompensationActuallessAllowancesBlackScholes_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Net Total Compensation - LTI (FAS + Face Value) Median (50%)','Net Total Compensation (All Incumbents) Median (50%)','Total Compensation Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Actual Total Direct Compensation 50th'))

-- Total Direct Actual 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Total Direct Actual 75th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc75_IW','TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc75_OW','TotalDirectActual_Perc75_IW','TotalDirectActual_Perc75_OW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc75_IW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Net Total Compensation - LTI (FAS + Face Value) High Quartile (75%)','Net Total Compensation (All Incumbents) High Quartile (75%)','Total Compensation High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Actual Total Direct Compensation 75th'))

-- Total Direct Actual 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Total Direct Actual 90th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc90_IW','TotalDirectCompensationActuallessAllowancesBlackScholesMTCS_Perc90_OW','TotalDirectActual_Perc90_IW','TotalDirectActual_Perc90_OW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc90_IW','TotalDirectCompensationActuallessAllowancesBlackScholes_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Net Total Compensation - LTI (FAS + Face Value) 90th Percentile (90%)','Net Total Compensation (All Incumbents) 90th Percentile (90%)','Total Compensation 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Actual Total Direct Compensation 90th'))

-- Target TDC 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TDC 25th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc25_IW','TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc25_OW','TotalDirectTarget_Perc25_IW','TotalDirectTarget_Perc25_OW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc25_IW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Net Total Compensation - LTI (FAS + Face Value) Low Quartile (25%)','Target Net Total Compensation (All Incumbents) Low Quartile (25%)','Target Total Compensation Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Target Total Direct Compensation 25th'))

-- Target TDC 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TDC 50th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Median_IW','TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Median_OW','TotalDirectTarget_Median_IW','TotalDirectTarget_Median_OW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Median_IW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Net Total Compensation - LTI (FAS + Face Value) Median (50%)','Target Net Total Compensation (All Incumbents) Median (50%)','Target Total Compensation Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Target Total Direct Compensation 50th'))

-- Target TDC 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TDC 75th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc75_IW','TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc75_OW','TotalDirectTarget_Perc75_IW','TotalDirectTarget_Perc75_OW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc75_IW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Net Total Compensation - LTI (FAS + Face Value) High Quartile (75%)','Target Net Total Compensation (All Incumbents) High Quartile (75%)','Target Total Compensation High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Target Total Direct Compensation 75th'))

-- Target TDC 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'Target TDC 90th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc90_IW','TotalDirectCompensationTargetlessAllowancesBlackScholesMTCS_Perc90_OW','TotalDirectTarget_Perc90_IW','TotalDirectTarget_Perc90_OW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc90_IW','TotalDirectCompensationTargetlessAllowancesBlackScholes_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Net Total Compensation - LTI (FAS + Face Value) 90th Percentile (90%)','Target Net Total Compensation (All Incumbents) 90th Percentile (90%)','Target Total Compensation 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Target Total Direct Compensation 90th'))

-- AI Percentage 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AI Percentage 25th Percentile'
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('STITargetPercentofBase_Perc25_IW','STITargetPercentofBase_Perc25_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Incentive (Receivers Only) Low Quartile (25%)','Target Bonus as a % of Base Salary Low Quartile (25%)','Target Incentive as a % of Base Salary Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Above Base Compensation Target % 25th','Target Bonus/Annual Incentive % of Annual Base Salary 25th','Target Bonus/Annual Incentive % of Base Salary 25th','Target Performance Bonus % of Base Salary 25th','Target Performance Bonus % of Annual Base Salary 25th','Above Base Comp Target % 25th'))

-- AI Percentage 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AI Percentage 50th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('STITargetPercentofBase_Median_IW','STITargetPercentofBase_Median_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Incentive (Receivers Only) Median (50%)','Target Bonus as a % of Base Salary Median (50%)','Target Incentive as a % of Base Salary Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Above Base Compensation Target % Median','Above Base Compensation Target % 50th','Target Bonus/Annual Incentive % of Annual Base Salary 50th','Target Bonus/Annual Incentive % of Base Salary 50th','Target Performance Bonus % of Base Salary 50th','Target Performance Bonus % of Annual Base Salary 50th','Above Base Comp Target % Median'))

-- AI Percentage 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AI Percentage 75th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('STITargetPercentofBase_Perc75_IW','STITargetPercentofBase_Perc75_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Incentive (Receivers Only) High Quartile (75%)','Target Bonus as a % of Base Salary High Quartile (75%)','Target Incentive as a % of Base Salary High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Above Base Compensation Target % 75th','Target Bonus/Annual Incentive % of Annual Base Salary 75th','Target Bonus/Annual Incentive % of Base Salary 75th','Target Performance Bonus % of Base Salary 75th','Target Performance Bonus % of Annual Base Salary 75th','Above Base Comp Target % 75th'))

-- AI Percentage 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'AI Percentage 90th Percentile' 
WHERE 
	(src.PublisherCode = 'ME' AND hdr.value in ('STITargetPercentofBase_Perc90_IW','STITargetPercentofBase_Perc90_OW'))
	OR (src.PublisherCode = 'AH' AND hdr.value in ('Target Incentive (Receivers Only) 90th Percentile (90%)','Target Bonus as a % of Base Salary 90th Percentile (90%)','Target Incentive as a % of Base Salary 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Above Base Compensation Target % 90th','Target Bonus/Annual Incentive % of Annual Base Salary 90th','Target Bonus/Annual Incentive % of Base Salary 90th','Target Performance Bonus % of Base Salary 90th','Target Performance Bonus % of Annual Base Salary 90th','Above Base Comp Target % 90th'))

-- LTI Percent of Base 25th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI Percent of Base 25th Percentile'
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('LTI as a % of Base (All Incumbents) Low Quartile (25%)','Long-Term Incentives as a % of Base Salary Low Quartile (25%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive % of Base Salary 25th'))

-- LTI Percent of Base 50th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI Percent of Base 50th Percentile' 
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('LTI as a % of Base (All Incumbents) Median (50%)','Long-Term Incentives as a % of Base Salary Median (50%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive % of Base Salary 50th'))

-- LTI Percent of Base 75th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI Percent of Base 75th Percentile' 
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('LTI as a % of Base (All Incumbents) High Quartile (75%)','Long-Term Incentives as a % of Base Salary High Quartile (75%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive % of Base Salary 75th'))

-- LTI Percent of Base 90th Percentile
UPDATE M
SET 
	M.ColumnNumber = hdr.ColumnNumber,
	M.PreviousColumnName = hdr.Value
FROM [stage].[ColumnHeaders] hdr
INNER JOIN Code_Source src ON hdr.Filename = src.Source AND hdr.Sheetname = src.TabName
INNER JOIN stage.ColumnMapping M ON hdr.Filename = M.Filename AND hdr.Sheetname = M.Sheetname AND M.ColumnName = 'LTI Percent of Base 90th Percentile' 
WHERE 
	(src.PublisherCode = 'AH' AND hdr.value in ('LTI as a % of Base (All Incumbents) 90th Percentile (90%)','Long-Term Incentives as a % of Base Salary 90th Percentile (90%)'))
	OR (src.PublisherCode = 'TW' AND hdr.value in ('Long-Term Incentive % of Base Salary 90th'))

END