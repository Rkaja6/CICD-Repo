CREATE TABLE [dbo].[Location] (
    [Id]                   BIGINT         NULL,
    [Location]             NVARCHAR (MAX) NULL,
    [Township]             NVARCHAR (MAX) NULL,
    [Range]                NVARCHAR (MAX) NULL,
    [Section]              NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate] DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME       DEFAULT (getdate()) NULL
);

