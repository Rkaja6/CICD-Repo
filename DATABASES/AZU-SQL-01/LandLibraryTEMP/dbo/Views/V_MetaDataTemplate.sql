










CREATE VIEW [dbo].[V_MetaDataTemplate]
AS
SELECT L.[RecordId]
      ,''  AS [Document No]
	  --'TLN-' + DT.ShortName + '-' + right('0000' + CAST(L.RecordId AS varchar),4) AS [Document No]
	  ,1 as Revision
	  ,L.[Title]
	  ,ISNULL('Document', '') as Type
	  ,'Final' as Status
	  ,ISNULL(O.Title, '') As Operator
	  ,ISNULL(LS.Title, '') AS [Original Lessees]
	  ,ISNULL(AN.AccountName, '') AS [Account Name]
	  ,ISNULL(L.[Title], '') as [File]
	  ,ISNULL(Replace([Comments], '"', ''''), '') AS Comments
	  ,ISNULL(CAST([AgreementDate] AS date), '') AS [Agreement Date]
	  ,ISNULL(BON.OwnerNumber, '') AS [BOLO Owner]
      ,ISNULL([Book], '') AS Book
      ,ISNULL(D.Title, '') AS Divider
      ,ISNULL([DocInstNo], '') AS [Doc Inst No]
      ,ISNULL(DT.ShortName + ' - ' + DT.Title, '')  AS [Doc Types]
      ,ISNULL([DocBarcode], '') AS DocBarcode
	  ,ISNULL(FN.FileNumber, '') AS [File Number]
      ,ISNULL([FileType1], '') AS [FileType]
      ,ISNULL([LegacyFileNumber], '') AS [Legacy File Number]
      ,ISNULL([MarketingPackage], '') AS [Marketing Package]
      ,ISNULL([Page], '') AS Page
	  ,ISNULL(P.Parish, '') AS Parish
	  ,ISNULL([SAPOwnerNo], '') AS SAPOwnerNo
	  ,ISNULL(CS.STR, '') AS [STRs]
	  ,ISNULL([Samson Owner], '') AS [Samson Owner]
	  ,ISNULL([DocumentNo], '') as [SharePoint Document Number]
	  ,ISNULL(S.Title, '') As [State]
	  ,ISNULL(SD.Title, '') AS [SubDivider]
  FROM [dbo].[LandLibrary_DocumentAgg] L
  LEFT JOIN Operators O
  ON L.[OperatorLookupId] = O.Id
  LEFT JOIN Lessees LS
  ON L.OriginalLesseeId = LS.Id
  LEFT JOIN Concat_AccountName AN
  ON L.RecordId = AN.RecordId
  LEFT JOIN Concat_OwnerNumber BON
  ON L.RecordId = BON.RecordId
  LEFT JOIN Dividers D
  on L.DividerLookupId = D.Id
  LEFT JOIN DocTypes DT
  on L.DocType1Id = DT.Id
  LEFT JOIN Concat_FileNumber FN
  ON L.RecordId = FN.RecordID
  LEFT JOIN Concat_Parish P
  ON L.RecordId = P.RecordId
  LEFT JOIN Concat_STR CS
  ON L.RecordId = CS.RecordId
  LEFT JOIN State S
  ON L.StateId = S.Id
  LEFT JOIN SubDividers SD
  ON L.SubDividerLookupId = SD.Id
  WHERE DT.Title IS NOT NULL