CREATE TABLE [dbo].[ListCommentTypeTb] (
    [Value]       INT           NOT NULL,
    [Description] VARCHAR (200) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListCommentTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

