﻿CREATE TABLE [dbo].[AT_INV_DET_BALFWD] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [ACCT]                 VARCHAR (10)    NULL,
    [ACCTG_PERIOD]         DATETIME        NULL,
    [ASSET]                VARCHAR (10)    NULL,
    [ASSET_ID]             VARCHAR (3)     NULL,
    [COMPANY]              VARCHAR (3)     NULL,
    [CONDITION]            VARCHAR (8)     NULL,
    [GROSS_AMT]            NUMERIC (19, 2) NULL,
    [GROSS_TRANS_ID]       VARCHAR (13)    NULL,
    [IN_SERVICE_PERIOD]    DATETIME        NULL,
    [LOCATION_COST_CENTER] VARCHAR (12)    NULL,
    [LOC_CC]               VARCHAR (12)    NULL,
    [NET_ACCT]             VARCHAR (10)    NULL,
    [PART_NO]              VARCHAR (8)     NULL,
    [PERSPECTIVE]          VARCHAR (11)    NULL,
    [SERIAL_NO]            VARCHAR (10)    NULL,
    [SERNO]                VARCHAR (10)    NULL,
    [SOURCE_CURRENCY]      VARCHAR (4)     NULL,
    [TRANS_CAT]            VARCHAR (9)     NULL,
    [TRANS_ID]             VARCHAR (9)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

