CREATE TABLE [dbo].[ListStateFilingFlagTb] (
    [Value]       INT          NOT NULL,
    [Description] VARCHAR (80) NULL,
    [ActiveFlag]  INT          NULL,
    CONSTRAINT [PK_ListStateFilingFlagTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

