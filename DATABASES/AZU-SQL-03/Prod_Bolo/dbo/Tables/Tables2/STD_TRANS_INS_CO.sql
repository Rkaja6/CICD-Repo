CREATE TABLE [dbo].[STD_TRANS_INS_CO] (
    [subValueId]                 VARCHAR (255)   NOT NULL,
    [STD_TRANS_INS_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [INS_AMTS]                   NUMERIC (19, 2) NULL,
    [INS_COMPANIES]              VARCHAR (3)     NULL,
    [INS_QTY1S]                  NUMERIC (19, 2) NULL,
    [INS_QTY2S]                  NUMERIC (19, 2) NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_TRANS_STD_TRANS_44836]
    ON [dbo].[STD_TRANS_INS_CO]([STD_TRANS_INS_ACCTG_PER_ID] ASC);

