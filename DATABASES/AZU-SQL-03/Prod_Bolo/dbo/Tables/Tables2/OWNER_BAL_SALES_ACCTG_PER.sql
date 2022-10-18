﻿CREATE TABLE [dbo].[OWNER_BAL_SALES_ACCTG_PER] (
    [subValueId]                   VARCHAR (255)   NOT NULL,
    [OWNER_BAL_SALE_DT_ID]         VARCHAR (255)   NULL,
    [ACCTG_PERIOD]                 DATETIME        NULL,
    [ADJ_TAKE_VOL1]                NUMERIC (19, 2) NULL,
    [ADJ_TAKE_VOL2]                NUMERIC (19, 2) NULL,
    [ADJ_TYPE_CODES]               VARCHAR (4)     NULL,
    [BTU_BASIS]                    VARCHAR (10)    NULL,
    [BTU_FACTOR]                   VARCHAR (10)    NULL,
    [ENTITLEMENT_DELIVERED_MCFS]   NUMERIC (19, 2) NULL,
    [ENTITLEMENT_DELIVERED_MMBTUS] NUMERIC (19, 2) NULL,
    [ENTITLEMENT_INTEREST]         NUMERIC (19, 8) NULL,
    [ENTITLEMENT_PRODUCED_MCFS]    NUMERIC (19, 2) NULL,
    [ENTITLEMENT_PRODUCED_MMBTUS]  NUMERIC (19, 2) NULL,
    [ENTITLEMENT_VALUES]           NUMERIC (19, 2) NULL,
    [ENTITLEMENT_VOL1]             NUMERIC (19, 2) NULL,
    [ENTITLEMENT_VOL2]             NUMERIC (19, 2) NULL,
    [GROSS_VALUES]                 NUMERIC (19, 2) NULL,
    [PPL_STMT_IDS]                 VARCHAR (17)    NULL,
    [PRESSURE_BASE]                VARCHAR (13)    NULL,
    [TAKEN_DELIVERED_MCFS]         NUMERIC (19, 2) NULL,
    [TAKEN_DELIVERED_MMBTUS]       NUMERIC (19, 2) NULL,
    [TAKEN_PRODUCED_MCFS]          NUMERIC (19, 2) NULL,
    [TAKEN_PRODUCED_MMBTUS]        NUMERIC (19, 2) NULL,
    [TAKE_VOL1]                    NUMERIC (19, 2) NULL,
    [TAKE_VOL2]                    NUMERIC (19, 2) NULL,
    [UPDATE_PGM]                   VARCHAR (14)    NULL,
    [UPDATE_SRC_ID]                VARCHAR (12)    NULL,
    [time_stamp]                   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_BAL_OWNER_BAL_29131]
    ON [dbo].[OWNER_BAL_SALES_ACCTG_PER]([OWNER_BAL_SALE_DT_ID] ASC);

