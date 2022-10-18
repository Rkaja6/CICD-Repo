CREATE TABLE [dbo].[PRD_EQUIP_ALLOC_EFF_DATE] (
    [PRD_EQUIP_ALLOC_EFF_DATE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [CALC_BASIS]                  VARCHAR (5)   NULL,
    [DAILY_DISPS]                 VARCHAR (5)   NULL,
    [DISPS]                       VARCHAR (5)   NULL,
    [EFF_DATES]                   DATETIME      NULL,
    [EXP_DATES]                   DATETIME      NULL,
    [MONTHLY_VOL_CODES]           VARCHAR (11)  NULL,
    [PROD_FAC_PRD_INDEX]          VARCHAR (12)  NULL,
    [RATES]                       VARCHAR (5)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRD_EQUIP_ALLOC_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_EQUIP_u2_id_65320]
    ON [dbo].[PRD_EQUIP_ALLOC_EFF_DATE]([u2_id] ASC);

