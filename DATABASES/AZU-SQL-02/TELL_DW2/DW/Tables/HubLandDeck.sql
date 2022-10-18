CREATE TABLE [DW].[HubLandDeck] (
    [RecordSource]    VARCHAR (50)  NOT NULL,
    [LoadDate]        DATETIME2 (7) CONSTRAINT [DF_HubLandDeck_LoadDate] DEFAULT (getdate()) NOT NULL,
    [Deck_Type]       VARCHAR (50)  NOT NULL,
    [Deck_ID]         VARCHAR (50)  NOT NULL,
    [LandDeckHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubLandDeck] PRIMARY KEY NONCLUSTERED ([LandDeckHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubLandDeck_Source_Deck_ID] UNIQUE NONCLUSTERED ([Deck_Type] ASC, [Deck_ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

