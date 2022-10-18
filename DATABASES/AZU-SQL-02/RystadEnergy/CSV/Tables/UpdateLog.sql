CREATE TABLE [CSV].[UpdateLog] (
    [Id]                   SMALLINT      NULL,
    [TableName]            VARCHAR (44)  NULL,
    [LastUpdated]          DATETIME      NULL,
    [TellurianUpdatedDate] DATETIME2 (7) DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME2 (7) DEFAULT (getdate()) NULL
);

