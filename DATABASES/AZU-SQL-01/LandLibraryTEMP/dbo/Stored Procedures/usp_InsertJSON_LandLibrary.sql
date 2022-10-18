




CREATE PROC [dbo].[usp_InsertJSON_LandLibrary] @jsonInput AS nvarchar(max)
AS
BEGIN
	INSERT INTO dbo.Stage_LandLibrary
	(
	[RowId]
	,[RecordId]
      ,[AccountId]
      ,[AgreementDate]
      ,[BOLOOwnerNoId]
      ,[Book]
      ,[DividerLookupId]
      ,[DocBarcode]
      ,[DocInstNo]
      ,[DocType1Id]
      ,[DocumentNo]
      ,[FileNumberId]
      ,[FileType1]
      ,[LegacyFileNumber]
      ,[MarketingPackage]
      ,[MultiLookup to Text]
      ,[Comments]
      ,[OperatorLookupId]
      ,[OriginalLesseeId]
      ,[Page]
      ,[ParishId]
      ,[Samson Owner]
      ,[SAPOwnerNo]
      ,[StateId]
      ,[STRId]
      ,[SubDividerLookupId]
      ,[Title])
	  SELECT *  
	FROM OPENJSON(@jsonInput) 
	WITH 
	(
[RowId] int,
[RecordId] int,
[AccountId] int,
[AgreementDate] datetime,
[BOLOOwnerNoId] int,
[Book] [varchar](4000) ,
[DividerLookupId] int,
[DocBarcode] [varchar](4000),
[DocInstNo] [varchar](4000),
[DocType1Id] int,
[DocumentNo] [varchar](4000) ,
[FileNumberId] int,
[FileType1] [varchar](4000) ,
[LegacyFileNumber] [varchar](4000) ,
[MarketingPackage] [varchar](4000) ,
[MultiLookup to Text] [varchar](4000),
[Comments] [varchar](4000) ,
[OperatorLookupId] int,
[OriginalLesseeId] int,
[Page] [varchar](4000) ,
[ParishId] int,
[Samson Owner] [varchar](4000) ,
[SAPOwnerNo] [varchar](4000) ,
[StateId] int,
[STRId] int,
[SubDividerLookupId] int,
[Title] [varchar](4000)
)
END