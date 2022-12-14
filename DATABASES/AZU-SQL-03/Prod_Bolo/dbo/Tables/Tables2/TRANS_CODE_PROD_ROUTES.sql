CREATE TABLE [dbo].[TRANS_CODE_PROD_ROUTES] (
    [TRANS_CODE_PROD_ROUTES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [PROD_ROUTES]               VARCHAR (6)   NULL,
    [PROD_ROUTE_EFF_DATES]      DATETIME      NULL,
    [PROD_ROUTE_EXP_DATES]      DATETIME      NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRANS_CODE_PROD_ROUTES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_COD_u2_id_67305]
    ON [dbo].[TRANS_CODE_PROD_ROUTES]([u2_id] ASC);

