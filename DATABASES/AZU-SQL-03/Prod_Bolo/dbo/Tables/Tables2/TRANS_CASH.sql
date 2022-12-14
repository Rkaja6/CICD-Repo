CREATE TABLE [dbo].[TRANS_CASH] (
    [TRANS_CASH_ID] VARCHAR (255)   NOT NULL,
    [u2_id]         VARCHAR (255)   NULL,
    [CASH_AMT]      NUMERIC (19, 2) NULL,
    [CASH_DATE]     DATETIME        NULL,
    [CASH_DOCUMENT] VARCHAR (24)    NULL,
    [INT_CASH_AMT]  NUMERIC (19, 2) NULL,
    [time_stamp]    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TRANS_CASH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_CASH_u2_id_in]
    ON [dbo].[TRANS_CASH]([u2_id] ASC);

