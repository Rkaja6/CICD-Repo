CREATE TABLE [dbo].[CC_FCAST_IDX] (
    [subValueId]                VARCHAR (255)   NOT NULL,
    [CC_FCAST_ID]               VARCHAR (255)   NULL,
    [FCAST_ACCT_ENTERED_TOTALS] NUMERIC (19, 2) NULL,
    [FCAST_INDEX]               VARCHAR (36)    NULL,
    [time_stamp]                DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_FCAST_IDX_CC_FCAST_ID_in]
    ON [dbo].[CC_FCAST_IDX]([CC_FCAST_ID] ASC);

