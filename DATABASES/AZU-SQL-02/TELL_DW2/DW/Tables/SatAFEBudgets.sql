CREATE TABLE [DW].[SatAFEBudgets] (
    [AFEHashKey]        CHAR (32)       NOT NULL,
    [AFEBudgetSequence] VARCHAR (27)    NOT NULL,
    [Account]           VARCHAR (10)    NOT NULL,
    [Company]           VARCHAR (7)     NOT NULL,
    [AccountingPeriod]  DATETIME2 (7)   NOT NULL,
    [RecordSource]      VARCHAR (50)    NOT NULL,
    [LoadDate]          DATETIME2 (7)   CONSTRAINT [DF__SatAFEBud__LoadD__025D5595] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]       DATETIME2 (7)   NULL,
    [Amount]            NUMERIC (19, 2) NULL,
    CONSTRAINT [PK_SatAFEBudgets] PRIMARY KEY NONCLUSTERED ([AFEHashKey] ASC, [AFEBudgetSequence] ASC, [Account] ASC, [Company] ASC, [AccountingPeriod] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

