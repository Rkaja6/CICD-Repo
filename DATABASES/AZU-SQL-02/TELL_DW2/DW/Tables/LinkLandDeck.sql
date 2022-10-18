CREATE TABLE [DW].[LinkLandDeck] (
    [LinkLandDeckHashKey] CHAR (32)     NOT NULL,
    [LandDeckHashKey]     CHAR (32)     NOT NULL,
    [PartyHashKey]        CHAR (32)     NOT NULL,
    [CostCenterHashKey]   CHAR (32)     NOT NULL,
    [RecordSource]        VARCHAR (50)  NOT NULL,
    [LoadDate]            DATETIME2 (7) CONSTRAINT [DF_LinkLandDeck_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkLandDeck] PRIMARY KEY NONCLUSTERED ([LinkLandDeckHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkLandDeck] UNIQUE NONCLUSTERED ([LandDeckHashKey] ASC, [PartyHashKey] ASC, [CostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

