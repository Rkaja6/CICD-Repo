CREATE TABLE [dbo].[PRICE_CTRC_EFF_DT] (
    [PRICE_CTRC_EFF_DT_ID]          VARCHAR (255)   NOT NULL,
    [u2_id]                         VARCHAR (255)   NULL,
    [BONUS_AMOUNT]                  NUMERIC (19, 5) NULL,
    [BONUS_DECM]                    NUMERIC (19, 4) NULL,
    [CTRC_PBASE]                    NUMERIC (19, 4) NULL,
    [CTRC_SATDRY]                   VARCHAR (3)     NULL,
    [DAILY_PRICING_FLAGS]           VARCHAR (7)     NULL,
    [DISTRIBUTE_FLAG]               VARCHAR (3)     NULL,
    [EFF_DATES]                     DATETIME        NULL,
    [EFF_DATE_STATUS]               VARCHAR (8)     NULL,
    [INVOICE_FLAG]                  VARCHAR (3)     NULL,
    [OVER_DELIVERED_PRICE_METHODS]  VARCHAR (8)     NULL,
    [OVR_CNV_FACTOR]                NUMERIC (19, 4) NULL,
    [OVR_GRAVITY]                   NUMERIC (9, 1)  NULL,
    [OVR_SOURCE_PBASE]              NUMERIC (19, 4) NULL,
    [OVR_SOURCE_SATDRY]             VARCHAR (3)     NULL,
    [PENALTY_PRICE_METHODS]         VARCHAR (8)     NULL,
    [PRICE_DFLT]                    VARCHAR (4)     NULL,
    [PRICE_METHODS]                 VARCHAR (8)     NULL,
    [PRICE_PARAMS_BASIS]            VARCHAR (6)     NULL,
    [PRICE_PARAMS_EFF_DATES]        DATETIME        NULL,
    [PRICE_PARAMS_EXP_DATES]        DATETIME        NULL,
    [PRICE_PARAMS_FIXED_PRICES]     NUMERIC (19, 5) NULL,
    [PRICE_PARAMS_FORMULAS]         VARCHAR (25)    NULL,
    [PRICE_PARAMS_METHOD_TYPES]     VARCHAR (8)     NULL,
    [PRICE_TIERS]                   VARCHAR (6)     NULL,
    [PRICE_VOLUME]                  VARCHAR (6)     NULL,
    [PURCHASER]                     VARCHAR (9)     NULL,
    [REMIT_TO]                      VARCHAR (8)     NULL,
    [SELLER]                        VARCHAR (9)     NULL,
    [SUMMARY_DIST_CONTRACTS]        VARCHAR (12)    NULL,
    [UNDER_DELIVERED_PRICE_METHODS] VARCHAR (8)     NULL,
    [UNDER_PRICE_METHODS]           VARCHAR (8)     NULL,
    [time_stamp]                    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PRICE_CTRC_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_CTRC_EFF_DT_u2_id_in]
    ON [dbo].[PRICE_CTRC_EFF_DT]([u2_id] ASC);

