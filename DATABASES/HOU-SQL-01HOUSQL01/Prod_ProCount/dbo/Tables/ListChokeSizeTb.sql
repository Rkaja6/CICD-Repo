CREATE TABLE [dbo].[ListChokeSizeTb] (
    [Value]       FLOAT (53)    NOT NULL,
    [Description] VARCHAR (200) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListChokeSizeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

