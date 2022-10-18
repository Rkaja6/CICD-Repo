CREATE TABLE [dbo].[PROD_FAC_PRD_EQUIP] (
    [subValueId]                     VARCHAR (255) NOT NULL,
    [PROD_FAC_PRD_EQUIP_EFF_DATE_ID] VARCHAR (255) NULL,
    [EQUIP_CALC_BASIS]               VARCHAR (5)   NULL,
    [EQUIP_DAILY_DISPS]              VARCHAR (5)   NULL,
    [EQUIP_DISPS]                    VARCHAR (5)   NULL,
    [EQUIP_IDS]                      VARCHAR (10)  NULL,
    [EQUIP_RATES]                    VARCHAR (16)  NULL,
    [EQUIP_TYPES]                    VARCHAR (5)   NULL,
    [IGNORE_FOR_DAILYS]              VARCHAR (6)   NULL,
    [MONTHLY_VOL_CODES]              VARCHAR (11)  NULL,
    [REDIRECT_DISPS]                 VARCHAR (6)   NULL,
    [REDIRECT_EQUIP_IDS]             VARCHAR (6)   NULL,
    [REDIRECT_EQUIP_TYPES]           VARCHAR (6)   NULL,
    [time_stamp]                     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_FAC__PROD_FAC__51734]
    ON [dbo].[PROD_FAC_PRD_EQUIP]([PROD_FAC_PRD_EQUIP_EFF_DATE_ID] ASC);

