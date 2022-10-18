﻿CREATE TABLE [dbo].[METER_PROD_ROUTES] (
    [METER_PROD_ROUTES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [PROD_ROUTES]          VARCHAR (9)   NULL,
    [PROD_ROUTE_EFF_DATES] DATETIME      NULL,
    [PROD_ROUTE_EXP_DATES] VARCHAR (8)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([METER_PROD_ROUTES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [METER_PROD_ROUTES_u2_id_in]
    ON [dbo].[METER_PROD_ROUTES]([u2_id] ASC);

