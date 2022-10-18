CREATE TABLE [DW].[LinkAFEEstimateCOA] (
    [AFEEstimateCOAHashKey]  CHAR (32)     NOT NULL,
    [AFEEstimateHashKey]     CHAR (32)     NOT NULL,
    [ChartOfAccountsHashKey] CHAR (32)     NOT NULL,
    [RecordSource]           VARCHAR (50)  NOT NULL,
    [LoadDate]               DATETIME2 (7) CONSTRAINT [DF_LinkAFEEstCOA_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkAFEEstimateCOA] PRIMARY KEY NONCLUSTERED ([AFEEstimateCOAHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkAFEEstimateHashCOAHash] UNIQUE NONCLUSTERED ([AFEEstimateHashKey] ASC, [ChartOfAccountsHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

