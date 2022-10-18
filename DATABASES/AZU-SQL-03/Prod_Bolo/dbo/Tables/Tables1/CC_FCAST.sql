CREATE TABLE [dbo].[CC_FCAST] (
    [CC_FCAST_ID]          VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [FCAST_COMPLETE_FLAGS] VARCHAR (8)     NULL,
    [FCAST_ENTERED_TOTALS] NUMERIC (19, 2) NULL,
    [FCAST_FYES]           VARCHAR (18)    NULL,
    [FCAST_TOTALS]         NUMERIC (19, 2) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CC_FCAST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_FCAST_u2_id_in]
    ON [dbo].[CC_FCAST]([u2_id] ASC);

