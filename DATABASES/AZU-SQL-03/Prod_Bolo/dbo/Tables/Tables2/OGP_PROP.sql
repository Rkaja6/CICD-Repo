﻿CREATE TABLE [dbo].[OGP_PROP] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [ANALYST]           VARCHAR (7)     NULL,
    [API_WELL_NO]       VARCHAR (12)    NULL,
    [COMPANY]           VARCHAR (3)     NULL,
    [CONTRACT_REQ_FLAG] VARCHAR (8)     NULL,
    [COST_CENTER]       VARCHAR (6)     NULL,
    [COUNTY]            VARCHAR (6)     NULL,
    [CO_OGCC_REQ_FLAG]  VARCHAR (4)     NULL,
    [DFLT_CPTS_FLAG]    VARCHAR (7)     NULL,
    [DISBURSE_CODE]     VARCHAR (4)     NULL,
    [DIV_ID]            VARCHAR (6)     NULL,
    [FIRST_PURCH_DATE]  DATETIME        NULL,
    [FORMATION]         VARCHAR (30)    NULL,
    [GE_CODE]           VARCHAR (2)     NULL,
    [GE_CODE_LEASE]     VARCHAR (15)    NULL,
    [GPA]               VARCHAR (10)    NULL,
    [GROUP_]            VARCHAR (5)     NULL,
    [INACTIVE_DATE]     DATETIME        NULL,
    [KS_NG_WELL_RPT]    VARCHAR (4)     NULL,
    [LAST_PURCH_DATE]   DATETIME        NULL,
    [LEGAL_DESC]        VARCHAR (30)    NULL,
    [NAME]              VARCHAR (30)    NULL,
    [PRIMARY_MILEAGE]   VARCHAR (5)     NULL,
    [PRIMARY_STATION]   VARCHAR (11)    NULL,
    [PRIOR_CO]          VARCHAR (5)     NULL,
    [PRIOR_CO_EXP_DATE] DATETIME        NULL,
    [PROCESS_CYCLE]     VARCHAR (5)     NULL,
    [PROCESS_GROUP]     VARCHAR (5)     NULL,
    [RANGE_ID]          VARCHAR (3)     NULL,
    [SECTION_]          VARCHAR (3)     NULL,
    [SEN168_FLAG]       VARCHAR (3)     NULL,
    [STATE]             VARCHAR (2)     NULL,
    [ST_FIELD]          VARCHAR (5)     NULL,
    [ST_LEASE_NO]       VARCHAR (10)    NULL,
    [SULPHUR]           NUMERIC (19, 4) NULL,
    [SULPHUR_DATE]      DATETIME        NULL,
    [TAX_ANALYST]       VARCHAR (9)     NULL,
    [TAX_DISTRICT]      VARCHAR (8)     NULL,
    [TOWNSHIP]          VARCHAR (3)     NULL,
    [WIRE_TRANSFER]     VARCHAR (4)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

