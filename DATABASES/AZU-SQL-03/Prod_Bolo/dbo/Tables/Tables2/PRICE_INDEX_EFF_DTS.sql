CREATE TABLE [dbo].[PRICE_INDEX_EFF_DTS] (
    [PRICE_INDEX_EFF_DTS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                  VARCHAR (255)   NULL,
    [EFF_DATES]              DATETIME        NULL,
    [GRAVITY_ADJ_CODES]      VARCHAR (8)     NULL,
    [PRICES]                 NUMERIC (19, 5) NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PRICE_INDEX_EFF_DTS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRICE_INDEX_EFF_DTS_u2_id_in]
    ON [dbo].[PRICE_INDEX_EFF_DTS]([u2_id] ASC);

