CREATE TABLE [dbo].[LandLibrary] (
    [RowId]               INT            NOT NULL,
    [RecordId]            INT            NOT NULL,
    [AccountId]           INT            NULL,
    [AgreementDate]       DATETIME       NULL,
    [BOLOOwnerNoId]       INT            NULL,
    [Book]                VARCHAR (4000) NULL,
    [DividerLookupId]     INT            NULL,
    [DocBarcode]          VARCHAR (4000) NULL,
    [DocInstNo]           VARCHAR (4000) NULL,
    [DocType1Id]          INT            NULL,
    [DocumentNo]          VARCHAR (4000) NULL,
    [FileNumberId]        INT            NULL,
    [FileType1]           VARCHAR (4000) NULL,
    [LegacyFileNumber]    VARCHAR (4000) NULL,
    [MarketingPackage]    VARCHAR (4000) NULL,
    [MultiLookup to Text] VARCHAR (4000) NULL,
    [Comments]            VARCHAR (4000) NULL,
    [OperatorLookupId]    INT            NULL,
    [OriginalLesseeId]    INT            NULL,
    [Page]                VARCHAR (4000) NULL,
    [ParishId]            INT            NULL,
    [Samson Owner]        VARCHAR (4000) NULL,
    [SAPOwnerNo]          VARCHAR (4000) NULL,
    [StateId]             INT            NULL,
    [STRId]               INT            NULL,
    [SubDividerLookupId]  INT            NULL,
    [Title]               VARCHAR (4000) NULL
);


GO
CREATE NONCLUSTERED INDEX [DistinctDocumentIndex]
    ON [dbo].[LandLibrary]([RowId] ASC, [RecordId] ASC)
    INCLUDE([AgreementDate], [BOLOOwnerNoId], [Book], [DividerLookupId], [DocBarcode], [DocInstNo], [DocType1Id], [DocumentNo], [FileNumberId], [FileType1], [LegacyFileNumber], [MarketingPackage], [MultiLookup to Text], [Comments], [OperatorLookupId], [OriginalLesseeId], [Page], [Samson Owner], [SAPOwnerNo], [StateId], [SubDividerLookupId], [Title]);

