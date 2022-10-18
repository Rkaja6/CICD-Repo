CREATE TABLE [dbo].[PRD_TRANS_INS_CO] (
    [subValueId]                 VARCHAR (255)   NOT NULL,
    [PRD_TRANS_INS_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [INS_AMTS]                   NUMERIC (19, 2) NULL,
    [INS_COMPANIES]              VARCHAR (3)     NULL,
    [INS_QTY1S]                  NUMERIC (19, 2) NULL,
    [INS_QTY2S]                  NUMERIC (19, 2) NULL,
    [time_stamp]                 DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_TRANS_PRD_TRANS_25824]
    ON [dbo].[PRD_TRANS_INS_CO]([PRD_TRANS_INS_ACCTG_PER_ID] ASC);

