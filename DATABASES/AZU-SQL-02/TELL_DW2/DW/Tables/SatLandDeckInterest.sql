CREATE TABLE [DW].[SatLandDeckInterest] (
    [RecordSource]            VARCHAR (50)    NOT NULL,
    [LoadDate]                DATETIME2 (7)   CONSTRAINT [DF_SatLandDeckInterest_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]             DATETIME2 (7)   NULL,
    [Effective_Date]          DATETIME2 (7)   NULL,
    [Expiration_Date]         DATETIME2 (7)   NULL,
    [NRI_INTEREST_TYPES]      VARCHAR (4)     NULL,
    [NET_REVENUE_INTERESTS]   NUMERIC (19, 8) NULL,
    [NRI_PAY_CODES]           VARCHAR (4)     NULL,
    [WI_PARENT_DECK]          VARCHAR (6)     NULL,
    [WORKING_INTERESTS]       NUMERIC (19, 8) NULL,
    [LandDeckInterestHashKey] BINARY (32)     NOT NULL,
    CONSTRAINT [PK_SatLandDeckInterest] PRIMARY KEY NONCLUSTERED ([LandDeckInterestHashKey] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

