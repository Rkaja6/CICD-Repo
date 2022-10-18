CREATE TABLE [DW].[LinkBudget] (
    [LinkBudgetHashKey]      CHAR (32)     NOT NULL,
    [BudgetHashKey]          CHAR (32)     NOT NULL,
    [AFEHashKey]             CHAR (32)     NOT NULL,
    [ChartOfAccountsHashKey] CHAR (32)     NOT NULL,
    [PartyHashKey]           CHAR (32)     NOT NULL,
    [CostCenterHashKey]      CHAR (32)     NOT NULL,
    [RecordSource]           VARCHAR (50)  NOT NULL,
    [LoadDate]               DATETIME2 (7) CONSTRAINT [DF_LinkBudget_LoadDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LinkBudget] PRIMARY KEY NONCLUSTERED ([LinkBudgetHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkBudgetComponentHashKey] UNIQUE NONCLUSTERED ([BudgetHashKey] ASC, [AFEHashKey] ASC, [ChartOfAccountsHashKey] ASC, [PartyHashKey] ASC, [CostCenterHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

