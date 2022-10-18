CREATE TABLE [DW].[LinkAFESupp] (
    [LinkAFESuppHashKey] CHAR (32)     NOT NULL,
    [AFEHashKey]         CHAR (32)     NOT NULL,
    [SuppAFEHashKey]     CHAR (32)     NOT NULL,
    [RecordSource]       VARCHAR (50)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF_LinkAFESupp_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkAFESupp] PRIMARY KEY NONCLUSTERED ([LinkAFESuppHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkAFESupp] UNIQUE NONCLUSTERED ([AFEHashKey] ASC, [SuppAFEHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

