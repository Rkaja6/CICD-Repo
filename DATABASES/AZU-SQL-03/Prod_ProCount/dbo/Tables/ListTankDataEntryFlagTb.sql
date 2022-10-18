CREATE TABLE [dbo].[ListTankDataEntryFlagTb] (
    [Value]       INT           NOT NULL,
    [Description] VARCHAR (200) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListTankDataEntryFlagTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

