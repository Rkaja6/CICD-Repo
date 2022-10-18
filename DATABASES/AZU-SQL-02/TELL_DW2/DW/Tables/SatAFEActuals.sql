CREATE TABLE [DW].[SatAFEActuals] (
    [TransactionHashKey] CHAR (32)       NOT NULL,
    [RecordSource]       VARCHAR (50)    NOT NULL,
    [LoadDate]           DATETIME2 (7)   CONSTRAINT [DF__SatAFEAct__LoadD__0169315C] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]        DATETIME2 (7)   NULL,
    [InvoiceNumber]      VARCHAR (19)    NULL,
    [AccountingPeriod]   DATETIME2 (7)   NULL,
    [TransactionDate]    DATETIME2 (7)   NULL,
    [Amount]             NUMERIC (19, 2) NULL,
    [IsPaid]             CHAR (1)        NULL,
    CONSTRAINT [PK_SatAFEActuals] PRIMARY KEY NONCLUSTERED ([TransactionHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

