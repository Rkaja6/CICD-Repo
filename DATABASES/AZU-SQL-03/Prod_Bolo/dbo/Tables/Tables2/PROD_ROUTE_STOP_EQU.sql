CREATE TABLE [dbo].[PROD_ROUTE_STOP_EQU] (
    [PROD_ROUTE_STOP_EQU_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [EQUIP_IDS]              VARCHAR (12)  NULL,
    [EQUIP_TYPES]            VARCHAR (5)   NULL,
    [EQ_EFF_DATES]           DATETIME      NULL,
    [EQ_EXP_DATES]           DATETIME      NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_ROUTE_STOP_EQU_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_ROUTE_STOP_EQU_u2_id_in]
    ON [dbo].[PROD_ROUTE_STOP_EQU]([u2_id] ASC);

