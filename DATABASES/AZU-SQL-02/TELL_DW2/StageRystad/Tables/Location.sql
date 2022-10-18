CREATE TABLE [StageRystad].[Location] (
    [Id]                   BIGINT         NOT NULL,
    [Location]             NVARCHAR (MAX) NULL,
    [Township]             NVARCHAR (MAX) NULL,
    [Range]                NVARCHAR (MAX) NULL,
    [Section]              NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate] DATETIME       NULL,
    [TellurianCreatedDate] DATETIME       NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Id] ASC)
);

