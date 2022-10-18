CREATE TABLE [dbo].[WELL_INFO_PRICE] (
    [WELL_INFO_PRICE_ID]   VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [AVG_PRICES]           NUMERIC (19, 2) NULL,
    [PRICE_ADJS]           VARCHAR (9)     NULL,
    [PRICE_BTUS]           VARCHAR (8)     NULL,
    [PRICE_COMMENTS]       VARCHAR (28)    NULL,
    [PRICE_GRAVITY]        VARCHAR (7)     NULL,
    [PRICE_PRODUCTS]       VARCHAR (7)     NULL,
    [PRICE_SHRINK_FACTORS] VARCHAR (6)     NULL,
    [PRICE_YIELDS]         VARCHAR (9)     NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_PRICE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_PRICE_u2_id_in]
    ON [dbo].[WELL_INFO_PRICE]([u2_id] ASC);

