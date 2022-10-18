CREATE TABLE [DW].[SatWellOriginPropNum] (
    [RecordSource]      VARCHAR (50)  NOT NULL,
    [LoadDate]          DATETIME2 (7) CONSTRAINT [DF__SatWellOr__LoadD__07220AB2] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]       DATETIME2 (7) NULL,
    [PropNum]           VARCHAR (12)  NULL,
    [WellOriginHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_SatWellOriginPropNum] PRIMARY KEY NONCLUSTERED ([WellOriginHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

