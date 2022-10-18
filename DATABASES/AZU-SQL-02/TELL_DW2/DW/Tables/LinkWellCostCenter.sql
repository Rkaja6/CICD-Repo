CREATE TABLE [DW].[LinkWellCostCenter] (
    [WellHashKey]           CHAR (32)     NOT NULL,
    [CostCenterHashKey]     CHAR (32)     NOT NULL,
    [RecordSource]          VARCHAR (50)  NOT NULL,
    [LoadDate]              DATETIME2 (7) CONSTRAINT [DF_LinkWellCC_LoadDate] DEFAULT (getdate()) NOT NULL,
    [WellCostCenterHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_LinkWellCostCenter] PRIMARY KEY NONCLUSTERED ([WellCostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkWellCC] UNIQUE NONCLUSTERED ([WellHashKey] ASC, [CostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

