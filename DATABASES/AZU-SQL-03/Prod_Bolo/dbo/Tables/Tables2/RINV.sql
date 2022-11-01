﻿CREATE TABLE [dbo].[RINV] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [ACCT]                 VARCHAR (10)    NULL,
    [ACCUM_DDA_AMT]        NUMERIC (19, 2) NULL,
    [AMT]                  NUMERIC (19, 2) NULL,
    [ASSET]                VARCHAR (12)    NULL,
    [COMPANY]              VARCHAR (3)     NULL,
    [CONDITION]            VARCHAR (4)     NULL,
    [GROSS_ACCT]           VARCHAR (10)    NULL,
    [GROSS_AMT]            NUMERIC (19, 2) NULL,
    [IN_SERVICE_DATE]      DATETIME        NULL,
    [IN_SERVICE_PERIOD]    DATETIME        NULL,
    [LOCATION_COST_CENTER] VARCHAR (12)    NULL,
    [NET_ACCT]             VARCHAR (10)    NULL,
    [PART_ID]              VARCHAR (4)     NULL,
    [PART_NO]              VARCHAR (4)     NULL,
    [QTY1]                 NUMERIC (19, 2) NULL,
    [QTY2]                 NUMERIC (19, 2) NULL,
    [SERIAL_NO]            VARCHAR (15)    NULL,
    [SOURCE_CURRENCY]      VARCHAR (4)     NULL,
    [TEMP_FLAG]            VARCHAR (9)     NULL,
    [TRANS_CAT]            VARCHAR (10)    NULL,
    [TRANS_CODE]           VARCHAR (10)    NULL,
    [TTY]                  VARCHAR (9)     NULL,
    [USER_PORT]            VARCHAR (9)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);
