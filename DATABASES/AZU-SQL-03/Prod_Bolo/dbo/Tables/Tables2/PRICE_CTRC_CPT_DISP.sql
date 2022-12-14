CREATE TABLE [dbo].[PRICE_CTRC_CPT_DISP] (
    [subValueId]         VARCHAR (255)   NOT NULL,
    [PRICE_CTRC_ENTX_ID] VARCHAR (255)   NULL,
    [CPT_CALC_BASIS]     VARCHAR (10)    NULL,
    [CPT_DISP]           VARCHAR (4)     NULL,
    [CPT_EFF_DATES]      DATETIME        NULL,
    [CPT_EXP_DATES]      DATETIME        NULL,
    [CPT_RATES]          NUMERIC (19, 6) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_CTR_PRICE_CTR_39779]
    ON [dbo].[PRICE_CTRC_CPT_DISP]([PRICE_CTRC_ENTX_ID] ASC);

