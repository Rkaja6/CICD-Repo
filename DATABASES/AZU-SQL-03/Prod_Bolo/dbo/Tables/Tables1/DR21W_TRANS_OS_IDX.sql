﻿CREATE TABLE [dbo].[DR21W_TRANS_OS_IDX] (
    [DR21W_TRANS_OS_IDX_ID]   VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCR_ADV_TAXES]          NUMERIC (19, 2) NULL,
    [ACCR_DED_CPT_AMT]        NUMERIC (19, 2) NULL,
    [ACCR_GROSS]              NUMERIC (19, 2) NULL,
    [ACCR_SEV_TAXES]          NUMERIC (19, 2) NULL,
    [ACCR_STRIPPER_OIL_ADVS]  NUMERIC (19, 2) NULL,
    [ACCR_STRIPPER_OIL_GROSS] NUMERIC (19, 2) NULL,
    [CASH_ADV_TAXES]          NUMERIC (19, 2) NULL,
    [CASH_DED_CPT_AMT]        NUMERIC (19, 2) NULL,
    [CASH_GROSS]              NUMERIC (19, 2) NULL,
    [CASH_SEV_TAXES]          NUMERIC (19, 2) NULL,
    [CASH_STRIPPER_OIL_ADVS]  NUMERIC (19, 2) NULL,
    [CASH_STRIPPER_OIL_GROSS] NUMERIC (19, 2) NULL,
    [CHECK_NOS]               VARCHAR (18)    NULL,
    [OWNER_SALE_INDEX]        VARCHAR (10)    NULL,
    [PAID_DATES]              DATETIME        NULL,
    [PRODUCTS]                VARCHAR (3)     NULL,
    [QTYS]                    NUMERIC (19, 2) NULL,
    [SALE_DATES]              DATETIME        NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([DR21W_TRANS_OS_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DR21W_TRANS_OS_IDX_u2_id_in]
    ON [dbo].[DR21W_TRANS_OS_IDX]([u2_id] ASC);

