CREATE TABLE [dbo].[ListTankMonthlyInvSourceTb] (
    [Value]       INT          NOT NULL,
    [Description] VARCHAR (80) NULL,
    [ActiveFlag]  INT          NULL,
    CONSTRAINT [PK_ListTankMonthlyInvSourceTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

