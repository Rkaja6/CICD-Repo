CREATE TABLE [dbo].[UpdateLog] (
    [Id]                   BIGINT             NULL,
    [TableName]            NVARCHAR (MAX)     NULL,
    [LastUpdated]          DATETIMEOFFSET (7) NULL,
    [TellurianUpdatedDate] DATETIME           DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME           DEFAULT (getdate()) NULL
);

