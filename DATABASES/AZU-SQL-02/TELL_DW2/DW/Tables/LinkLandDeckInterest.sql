CREATE TABLE [DW].[LinkLandDeckInterest] (
    [LinkLandDeckInterestHashKey] CHAR (32)     NOT NULL,
    [LandDeckInterestHashKey]     CHAR (32)     NOT NULL,
    [LandDeckHashKey]             CHAR (32)     NOT NULL,
    [PartyHashKey]                CHAR (32)     NOT NULL,
    [RecordSource]                VARCHAR (50)  NOT NULL,
    [LoadDate]                    DATETIME2 (7) CONSTRAINT [DF_LinkLandDeckInterest_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkLandDeckInterest] PRIMARY KEY NONCLUSTERED ([LinkLandDeckInterestHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkLandDeckInterest] UNIQUE NONCLUSTERED ([LandDeckInterestHashKey] ASC, [LandDeckHashKey] ASC, [PartyHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

