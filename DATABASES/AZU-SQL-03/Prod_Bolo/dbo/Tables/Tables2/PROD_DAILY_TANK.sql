CREATE TABLE [dbo].[PROD_DAILY_TANK] (
    [PROD_DAILY_TANK_ID]          VARCHAR (255)   NOT NULL,
    [u2_id]                       VARCHAR (255)   NULL,
    [FEET]                        VARCHAR (4)     NULL,
    [FRACTIONAL_INCHES]           VARCHAR (10)    NULL,
    [INCHES]                      VARCHAR (6)     NULL,
    [TANK_BEGIN_INVENTORY]        NUMERIC (19, 2) NULL,
    [TANK_BEGIN_WATER_INVENTORY]  NUMERIC (19, 2) NULL,
    [TANK_ENDING_INVENTORY]       NUMERIC (19, 2) NULL,
    [TANK_ENDING_WATER_INVENTORY] NUMERIC (19, 2) NULL,
    [TANK_INDEX]                  VARCHAR (5)     NULL,
    [TANK_NET_OIL_VOLS]           NUMERIC (19, 2) NULL,
    [TANK_OIL_SALES]              NUMERIC (19, 2) NULL,
    [TANK_WATER_VOLS]             NUMERIC (19, 2) NULL,
    [WATER_FEET]                  NUMERIC (9)     NULL,
    [WATER_FRACTIONAL_INCHES]     NUMERIC (9)     NULL,
    [WATER_INCHES]                NUMERIC (9)     NULL,
    [time_stamp]                  DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_TANK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAILY_TANK_u2_id_in]
    ON [dbo].[PROD_DAILY_TANK]([u2_id] ASC);

