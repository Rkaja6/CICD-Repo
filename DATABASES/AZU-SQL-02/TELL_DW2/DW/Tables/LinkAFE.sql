CREATE TABLE [DW].[LinkAFE] (
    [LinkAFEHashKey]    CHAR (32)     NOT NULL,
    [AFEHashKey]        CHAR (32)     NOT NULL,
    [CostCenterHashKey] CHAR (32)     NOT NULL,
    [PartyHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]      VARCHAR (50)  NOT NULL,
    [LoadDate]          DATETIME2 (7) CONSTRAINT [DF_LinkAFE_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkAFE] PRIMARY KEY NONCLUSTERED ([LinkAFEHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkAFEComponentHash] UNIQUE NONCLUSTERED ([AFEHashKey] ASC, [CostCenterHashKey] ASC, [PartyHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

