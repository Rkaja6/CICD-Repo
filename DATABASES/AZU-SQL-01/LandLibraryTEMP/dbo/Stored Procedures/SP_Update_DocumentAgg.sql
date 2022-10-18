


CREATE PROCEDURE [dbo].[SP_Update_DocumentAgg]
AS
BEGIN
TRUNCATE TABLE dbo.LandLibrary_DocumentAgg;
INSERT INTO dbo.LandLibrary_DocumentAgg
SELECT distinct [RecordId]
      ,[AgreementDate]
      ,[Book]
      ,[DividerLookupId]
      ,[DocBarcode]
      ,[DocInstNo]
      ,[DocType1Id]
      ,[DocumentNo]
      ,[FileType1]
      ,[LegacyFileNumber]
      ,[MarketingPackage]
      ,[MultiLookup to Text]
      ,[Comments]
      ,[OperatorLookupId]
      ,[OriginalLesseeId]
      ,[Page]
      ,[Samson Owner]
      ,[SAPOwnerNo]
      ,[StateId]
      ,[SubDividerLookupId]
      ,[Title]
  FROM [dbo].[LandLibrary]
  END