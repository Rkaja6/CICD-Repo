CREATE TABLE [DW].[HubTransaction] (
    [TransactionHashKey] CHAR (32)     NOT NULL,
    [RecordSource]       VARCHAR (50)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF__HubTransa__LoadD__77DFC722] DEFAULT (getdate()) NOT NULL,
    [Transaction_u2_id]  VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_HubTransaction] PRIMARY KEY NONCLUSTERED ([TransactionHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_HubTransaction_Transaction_u2_id] UNIQUE NONCLUSTERED ([Transaction_u2_id] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

