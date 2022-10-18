



Create Procedure 
[stage].[usp_CleanExcelMetadata]
as
BEGIN
-- these are sheets that have introductory info, or, in the case of Mercer, distinguish jobs by position class, which we do not track currently.
Delete from [stage].[ExcelMetadata]
WHERE [SheetName] IN ('Introduction Tab','Introduction','Information','TitlePage','Organizations','Jobs','Participant List By Alpha','Blended Jobs','Job & PC_IW','Job & PC_OW')
OR [SheetName] like 'PC - %'
END