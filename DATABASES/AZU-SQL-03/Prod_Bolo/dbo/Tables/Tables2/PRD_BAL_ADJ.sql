CREATE TABLE [dbo].[PRD_BAL_ADJ] (
    [u2_id]            VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]     DATETIME        NULL,
    [ADJ_TYPE]         VARCHAR (10)    NULL,
    [APPR]             VARCHAR (4)     NULL,
    [APPR_DATE]        DATETIME        NULL,
    [BTU_BASIS]        VARCHAR (10)    NULL,
    [BTU_FACTOR]       VARCHAR (10)    NULL,
    [COMPANY]          VARCHAR (7)     NULL,
    [COST_CENTER]      VARCHAR (10)    NULL,
    [DESCRIPTION]      VARCHAR (35)    NULL,
    [OWNER_VOL_STATUS] VARCHAR (6)     NULL,
    [PRESSURE_BASE]    VARCHAR (10)    NULL,
    [PRICE]            NUMERIC (19, 5) NULL,
    [PRODUCT]          VARCHAR (3)     NULL,
    [SALE_DATE]        DATETIME        NULL,
    [SYSTEM_DATE]      DATETIME        NULL,
    [SYSTEM_TIME]      VARCHAR (6)     NULL,
    [SYSTEM_USER_ID]   VARCHAR (10)    NULL,
    [time_stamp]       DATETIME        NULL,
    [u2_checksum]      VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

