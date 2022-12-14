CREATE TABLE [dbo].[GATH_SYS_SRC_PRODUCTS] (
    [GATH_SYS_SRC_PRODUCTS_ID]    VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [ALLOC_PRODUCTS]              VARCHAR (8)   NULL,
    [SOURCE_PRODUCTS]             VARCHAR (7)   NULL,
    [SOURCE_PRODUCT_SUB_SYSTEM]   VARCHAR (6)   NULL,
    [SUM_DAILY_FOR_MONTHLY_FLAGS] VARCHAR (11)  NULL,
    [THEO_PRODUCTS]               VARCHAR (8)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GATH_SYS_SRC_PRODUCTS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GATH_SYS_SRC_PRODUCTS_u2_id_in]
    ON [dbo].[GATH_SYS_SRC_PRODUCTS]([u2_id] ASC);

