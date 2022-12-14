CREATE TABLE [dbo].[TEN99_STATE_SYS_WH_INT_CAT] (
    [subValueId]            VARCHAR (255) NOT NULL,
    [TEN99_STATE_SYS_WH_ID] VARCHAR (255) NULL,
    [WH_INT_CATS]           VARCHAR (3)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TEN99_STA_TEN99_STA_63315]
    ON [dbo].[TEN99_STATE_SYS_WH_INT_CAT]([TEN99_STATE_SYS_WH_ID] ASC);

