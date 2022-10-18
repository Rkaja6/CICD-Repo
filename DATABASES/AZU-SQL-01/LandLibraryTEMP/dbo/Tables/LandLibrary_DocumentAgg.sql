CREATE TABLE [dbo].[LandLibrary_DocumentAgg] (
    [RecordId]            INT            NOT NULL,
    [AgreementDate]       DATETIME       NULL,
    [Book]                VARCHAR (4000) NULL,
    [DividerLookupId]     INT            NULL,
    [DocBarcode]          VARCHAR (4000) NULL,
    [DocInstNo]           VARCHAR (4000) NULL,
    [DocType1Id]          INT            NULL,
    [DocumentNo]          VARCHAR (4000) NULL,
    [FileType1]           VARCHAR (4000) NULL,
    [LegacyFileNumber]    VARCHAR (4000) NULL,
    [MarketingPackage]    VARCHAR (4000) NULL,
    [MultiLookup to Text] VARCHAR (4000) NULL,
    [Comments]            VARCHAR (4000) NULL,
    [OperatorLookupId]    INT            NULL,
    [OriginalLesseeId]    INT            NULL,
    [Page]                VARCHAR (4000) NULL,
    [Samson Owner]        VARCHAR (4000) NULL,
    [SAPOwnerNo]          VARCHAR (4000) NULL,
    [StateId]             INT            NULL,
    [SubDividerLookupId]  INT            NULL,
    [Title]               VARCHAR (4000) NULL
);

