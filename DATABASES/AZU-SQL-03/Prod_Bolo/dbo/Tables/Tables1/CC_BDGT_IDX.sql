CREATE TABLE [dbo].[CC_BDGT_IDX] (
    [subValueId]          VARCHAR (255)   NOT NULL,
    [CC_BUD_ID]           VARCHAR (255)   NULL,
    [ACCT_ENTERED_TOTALS] NUMERIC (19, 2) NULL,
    [BUDGET_INDEX]        VARCHAR (36)    NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_BDGT_IDX_CC_BUD_ID_in]
    ON [dbo].[CC_BDGT_IDX]([CC_BUD_ID] ASC);

