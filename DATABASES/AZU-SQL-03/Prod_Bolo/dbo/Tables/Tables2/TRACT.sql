﻿CREATE TABLE [dbo].[TRACT] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [ACCTG_COST_CENTER]    VARCHAR (10)    NULL,
    [BASIN]                VARCHAR (9)     NULL,
    [BILLING_COST_CENTER]  VARCHAR (7)     NULL,
    [BILLING_DECK_ID]      VARCHAR (7)     NULL,
    [COST_CENTER]          VARCHAR (10)    NULL,
    [COUNTY]               VARCHAR (6)     NULL,
    [DECK_ID]              VARCHAR (6)     NULL,
    [DECK_TYPE]            VARCHAR (4)     NULL,
    [DISTRICT]             VARCHAR (6)     NULL,
    [ENTERED_NET_ACRES]    NUMERIC (19, 4) NULL,
    [EXT_DATE]             DATETIME        NULL,
    [FIELD_ID]             VARCHAR (6)     NULL,
    [GROSS_FT]             NUMERIC (19, 2) NULL,
    [LEASE]                VARCHAR (12)    NULL,
    [LEASE_ID]             VARCHAR (12)    NULL,
    [LEGAL_DESC_ID]        VARCHAR (17)    NULL,
    [LESSOR_MIN_INTEREST]  NUMERIC (19, 8) NULL,
    [LESSOR_ROYALTY]       NUMERIC (19, 8) NULL,
    [MERIDIAN]             VARCHAR (9)     NULL,
    [MORTGAGE]             VARCHAR (4)     NULL,
    [NET_REVENUE_INTEREST] NUMERIC (19, 8) NULL,
    [NEXT_MAP_ID]          VARCHAR (3)     NULL,
    [ORRI]                 NUMERIC (19, 8) NULL,
    [OTHER_LEGAL_DESC]     VARCHAR (3881)  NULL,
    [PROSPECT]             VARCHAR (6)     NULL,
    [PUD_FLAG]             VARCHAR (4)     NULL,
    [REPORT_GROSS_ACRES]   NUMERIC (19, 4) NULL,
    [REPORT_GROSS_FT]      NUMERIC (19, 2) NULL,
    [SEQ_NO]               VARCHAR (10)    NULL,
    [STATE]                VARCHAR (2)     NULL,
    [STATUS]               VARCHAR (6)     NULL,
    [SURFACE_GROSS_ACRES]  NUMERIC (19, 4) NULL,
    [SURVEY_METHOD]        VARCHAR (6)     NULL,
    [TERMINATION_DATE]     DATETIME        NULL,
    [TERMINATION_REMARKS]  VARCHAR (521)   NULL,
    [TERMINATION_TYPE]     VARCHAR (4)     NULL,
    [TGS_SEC_DESCS]        VARCHAR (20)    NULL,
    [TRACT_NO]             VARCHAR (5)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

