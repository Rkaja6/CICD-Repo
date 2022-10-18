CREATE TABLE [DW].[HubChartOfAccounts] (
    [RecordSource]           VARCHAR (50)  NOT NULL,
    [LoadDate]               DATETIME2 (7) CONSTRAINT [DF__HubChartO__LoadD__75F77EB0] DEFAULT (getdate()) NOT NULL,
    [COAu2_id]               VARCHAR (255) NOT NULL,
    [ChartOfAccountsHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubChartOfAccounts] PRIMARY KEY NONCLUSTERED ([ChartOfAccountsHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubChartOfAccountsCOAu2_id] UNIQUE NONCLUSTERED ([COAu2_id] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

