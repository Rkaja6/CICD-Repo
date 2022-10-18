CREATE TABLE [DW].[HubBudget] (
    [BudgetHashKey] CHAR (32)     NOT NULL,
    [RecordSource]  VARCHAR (50)  NOT NULL,
    [LoadDate]      DATETIME2 (7) CONSTRAINT [DF_HubBudget_LoadDate] DEFAULT (getdate()) NOT NULL,
    [Budget_u2_id]  VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_HubBudget] PRIMARY KEY NONCLUSTERED ([BudgetHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubBudget_u2_id] UNIQUE NONCLUSTERED ([Budget_u2_id] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

