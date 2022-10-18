CREATE TABLE [DW].[SatBudget] (
    [BudgetHashKey]    CHAR (32)       NOT NULL,
    [RecordSource]     VARCHAR (50)    NOT NULL,
    [LoadDate]         DATETIME2 (7)   CONSTRAINT [DF_SatBudget_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]      DATETIME2 (7)   NULL,
    [AccountingPeriod] DATETIME2 (7)   NOT NULL,
    [Amount]           NUMERIC (19, 2) NULL,
    [Stat1_Amount]     NUMERIC (19, 2) NULL,
    [Stat2_Amount]     NUMERIC (19, 2) NULL,
    CONSTRAINT [PK_SatBudget] PRIMARY KEY NONCLUSTERED ([BudgetHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

