CREATE TABLE [DW].[SatWellOriginUID] (
    [RecordSource]      VARCHAR (50)  NOT NULL,
    [LoadDate]          DATETIME2 (7) CONSTRAINT [DF__SatWellOr__LoadD__08162EEB] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]       DATETIME2 (7) NULL,
    [WellOriginUID]     INT           NULL,
    [WellOriginHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_SatWellOriginUID] PRIMARY KEY NONCLUSTERED ([WellOriginHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

