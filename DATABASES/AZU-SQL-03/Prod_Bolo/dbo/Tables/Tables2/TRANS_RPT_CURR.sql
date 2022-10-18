CREATE TABLE [dbo].[TRANS_RPT_CURR] (
    [TRANS_RPT_CURR_ID]      VARCHAR (255)   NOT NULL,
    [u2_id]                  VARCHAR (255)   NULL,
    [EXCH_RATE]              VARCHAR (9)     NULL,
    [EXCH_RATE_DATE]         DATETIME        NULL,
    [EXCH_RATE_DATE_ENABLED] VARCHAR (8)     NULL,
    [EXCH_RATE_SOURCE]       VARCHAR (8)     NULL,
    [RPT_AMT]                NUMERIC (19, 2) NULL,
    [RPT_GROSS_AMT]          NUMERIC (19, 2) NULL,
    [RPT_GROSS_QTY1]         NUMERIC (19, 2) NULL,
    [RPT_GROSS_QTY2]         NUMERIC (19, 2) NULL,
    [RPT_QTY1]               NUMERIC (19, 2) NULL,
    [RPT_QTY2]               NUMERIC (19, 2) NULL,
    [RPT_STAT1_AMT]          NUMERIC (19, 2) NULL,
    [RPT_STAT1_QTY1]         NUMERIC (19, 2) NULL,
    [RPT_STAT1_QTY2]         NUMERIC (19, 2) NULL,
    [RPT_STAT2_AMT]          NUMERIC (19, 2) NULL,
    [RPT_STAT2_QTY1]         NUMERIC (19, 2) NULL,
    [RPT_STAT2_QTY2]         NUMERIC (19, 2) NULL,
    [TARGET_CURRENCIES]      VARCHAR (4)     NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TRANS_RPT_CURR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_RPT_CURR_u2_id_in]
    ON [dbo].[TRANS_RPT_CURR]([u2_id] ASC);

