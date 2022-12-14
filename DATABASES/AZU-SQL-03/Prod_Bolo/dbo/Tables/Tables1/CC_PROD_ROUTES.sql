CREATE TABLE [dbo].[CC_PROD_ROUTES] (
    [CC_PROD_ROUTES_ID]    VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [PROD_ROUTES]          VARCHAR (9)   NULL,
    [PROD_ROUTE_EFF_DATES] DATETIME      NULL,
    [PROD_ROUTE_EXP_DATES] DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_PROD_ROUTES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_PROD_ROUTES_u2_id_in]
    ON [dbo].[CC_PROD_ROUTES]([u2_id] ASC);

