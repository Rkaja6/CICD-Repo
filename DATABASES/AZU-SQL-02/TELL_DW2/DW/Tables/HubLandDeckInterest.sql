CREATE TABLE [DW].[HubLandDeckInterest] (
    [RecordSource]            VARCHAR (50)  NOT NULL,
    [LoadDate]                DATETIME2 (7) CONSTRAINT [DF_HubLandDeckInt_LoadDate] DEFAULT (getdate()) NOT NULL,
    [Deck_Type]               VARCHAR (50)  NOT NULL,
    [Interest_ID]             VARCHAR (50)  NOT NULL,
    [LandDeckInterestHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubLandDeckInterest] PRIMARY KEY NONCLUSTERED ([LandDeckInterestHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubLandDeckINt_Deck_Type_ID] UNIQUE NONCLUSTERED ([Deck_Type] ASC, [Interest_ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

