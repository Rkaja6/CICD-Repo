﻿CREATE TABLE [dbo].[RESERVE_TRANS_CF_INS] (
    [subValueId]            VARCHAR (255)   NOT NULL,
    [RESERVE_TRANS_CASH_ID] VARCHAR (255)   NULL,
    [CF_INS_AMTS]           NUMERIC (19, 2) NULL,
    [CF_INS_COMPANIES]      VARCHAR (3)     NULL,
    [CF_POST_DATE]          DATETIME        NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RESERVE_T_RESERVE_T_92064]
    ON [dbo].[RESERVE_TRANS_CF_INS]([RESERVE_TRANS_CASH_ID] ASC);
