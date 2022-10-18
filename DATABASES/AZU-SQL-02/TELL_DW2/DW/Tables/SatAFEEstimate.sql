CREATE TABLE [DW].[SatAFEEstimate] (
    [AFEEstimateHashKey] CHAR (32)       NOT NULL,
    [RecordSource]       VARCHAR (50)    NOT NULL,
    [LoadDate]           DATETIME2 (7)   CONSTRAINT [DF_SatAFEEst_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]        DATETIME2 (7)   NULL,
    [InvoiceNumber]      VARCHAR (19)    NULL,
    [AccountingPeriod]   DATETIME2 (7)   NULL,
    [TransactionDate]    DATETIME2 (7)   NULL,
    [Amount]             NUMERIC (19, 2) NULL,
    [IsPaid]             CHAR (1)        NULL,
    CONSTRAINT [PK_SatAFEEstimate] PRIMARY KEY NONCLUSTERED ([AFEEstimateHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

