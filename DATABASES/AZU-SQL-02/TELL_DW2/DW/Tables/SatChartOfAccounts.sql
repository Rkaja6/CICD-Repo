CREATE TABLE [DW].[SatChartOfAccounts] (
    [RecordSource]           VARCHAR (50)  NOT NULL,
    [LoadDate]               DATETIME2 (7) CONSTRAINT [DF_SatCOA_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]            DATETIME2 (7) NULL,
    [MajorAccountCode]       VARCHAR (4)   NULL,
    [MajorAccountName]       VARCHAR (46)  NULL,
    [SubAccountCode]         VARCHAR (4)   NULL,
    [SubAccountName]         VARCHAR (46)  NULL,
    [CATEGORY]               VARCHAR (5)   NULL,
    [ACCT_DESIGNATION]       VARCHAR (4)   NULL,
    [JIB_REQ]                VARCHAR (5)   NULL,
    [QTY_REQ]                VARCHAR (3)   NULL,
    [SL_REQ]                 VARCHAR (3)   NULL,
    [NORMAL_BAL]             VARCHAR (4)   NULL,
    [ChartOfAccountsHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_SatChartOfAccounts] PRIMARY KEY NONCLUSTERED ([ChartOfAccountsHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

