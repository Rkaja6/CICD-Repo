CREATE TABLE [dbo].[RESERVE_TRANS_INS_CO] (
    [subValueId]                     VARCHAR (255)   NOT NULL,
    [RESERVE_TRANS_INS_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [INS_AMTS]                       NUMERIC (19, 2) NULL,
    [INS_COMPANIES]                  VARCHAR (3)     NULL,
    [INS_QTY1S]                      NUMERIC (19, 2) NULL,
    [INS_QTY2S]                      NUMERIC (19, 2) NULL,
    [time_stamp]                     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RESERVE_T_RESERVE_T_99119]
    ON [dbo].[RESERVE_TRANS_INS_CO]([RESERVE_TRANS_INS_ACCTG_PER_ID] ASC);

