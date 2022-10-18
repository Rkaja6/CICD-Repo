CREATE TABLE [dbo].[ListFirstDayFlagTb] (
    [Value]       INT           NOT NULL,
    [Description] VARCHAR (200) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListFirstDayFlagTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

