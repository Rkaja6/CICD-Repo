CREATE TABLE [dbo].[USER_RPT_FMT_BRK_LVL] (
    [subValueId]            VARCHAR (255) NOT NULL,
    [USER_RPT_FMT_LEVEL_ID] VARCHAR (255) NULL,
    [ROW_BREAK_LEVELS]      VARCHAR (21)  NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USER_RPT__USER_RPT__89954]
    ON [dbo].[USER_RPT_FMT_BRK_LVL]([USER_RPT_FMT_LEVEL_ID] ASC);

