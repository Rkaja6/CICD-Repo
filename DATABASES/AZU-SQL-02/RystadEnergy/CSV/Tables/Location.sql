CREATE TABLE [CSV].[Location] (
    [Id]                   INT          NULL,
    [Location]             VARCHAR (17) NULL,
    [Township]             VARCHAR (4)  NULL,
    [Range]                VARCHAR (4)  NULL,
    [Section]              VARCHAR (3)  NULL,
    [TellurianUpdatedDate] DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME     DEFAULT (getdate()) NULL
);

