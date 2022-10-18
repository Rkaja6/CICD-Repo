CREATE TABLE [dbo].[IR_TRANS_SUM_TRANS_CURR] (
    [IR_TRANS_SUM_TRANS_CURR_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                      VARCHAR (255)   NULL,
    [RPT_AMT]                    NUMERIC (19, 2) NULL,
    [RPT_QTY1]                   NUMERIC (19, 2) NULL,
    [RPT_QTY2]                   NUMERIC (19, 2) NULL,
    [TARGET_CURRENCY]            VARCHAR (4)     NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([IR_TRANS_SUM_TRANS_CURR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IR_TRANS__u2_id_46592]
    ON [dbo].[IR_TRANS_SUM_TRANS_CURR]([u2_id] ASC);

