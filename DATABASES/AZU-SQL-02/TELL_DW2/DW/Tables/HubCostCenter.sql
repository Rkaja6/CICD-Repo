CREATE TABLE [DW].[HubCostCenter] (
    [RecordSource]      VARCHAR (50)  NOT NULL,
    [LoadDate]          DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CCu2_id]           VARCHAR (255) NOT NULL,
    [CostCenterHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubCostCenter] PRIMARY KEY NONCLUSTERED ([CostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubCostCenterCCu2_id] UNIQUE NONCLUSTERED ([CCu2_id] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

