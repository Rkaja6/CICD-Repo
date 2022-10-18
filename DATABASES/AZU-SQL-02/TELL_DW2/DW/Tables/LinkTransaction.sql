CREATE TABLE [DW].[LinkTransaction] (
    [LinkTransactionHashKey] CHAR (32)     NOT NULL,
    [TransactionHashKey]     CHAR (32)     NOT NULL,
    [AFEHashKey]             CHAR (32)     NOT NULL,
    [ChartOfAccountsHashKey] CHAR (32)     NOT NULL,
    [PartyHashKey]           CHAR (32)     NOT NULL,
    [CostCenterHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]           VARCHAR (50)  NOT NULL,
    [LoadDate]               DATETIME2 (7) CONSTRAINT [DF_LinkTrans_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkTransaction] PRIMARY KEY NONCLUSTERED ([LinkTransactionHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkTransactionComponentHashKey] UNIQUE NONCLUSTERED ([TransactionHashKey] ASC, [AFEHashKey] ASC, [ChartOfAccountsHashKey] ASC, [PartyHashKey] ASC, [CostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

