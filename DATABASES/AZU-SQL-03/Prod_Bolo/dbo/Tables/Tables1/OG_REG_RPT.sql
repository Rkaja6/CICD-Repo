CREATE TABLE [dbo].[OG_REG_RPT] (
    [u2_id]                    VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]             DATETIME        NULL,
    [AFFL_CODE]                VARCHAR (4)     NULL,
    [ALT_RPT_NO]               VARCHAR (10)    NULL,
    [ALT_RPT_TAXID]            VARCHAR (15)    NULL,
    [AMENDMENT_FLAG]           VARCHAR (5)     NULL,
    [API_NUMBER]               VARCHAR (8)     NULL,
    [APP]                      VARCHAR (10)    NULL,
    [AVG_PROD]                 NUMERIC (19, 2) NULL,
    [CC_DELIV_PT]              VARCHAR (8)     NULL,
    [CNV_ID]                   VARCHAR (10)    NULL,
    [CNV_NAME]                 VARCHAR (8)     NULL,
    [COMPANY]                  VARCHAR (10)    NULL,
    [COMPANY_VALUE]            NUMERIC (19, 2) NULL,
    [COMPANY_VOLUME]           NUMERIC (19, 2) NULL,
    [CONTACT_NO]               VARCHAR (10)    NULL,
    [CONTRA_OG_REG_RPT_ID]     VARCHAR (10)    NULL,
    [COUNTY]                   VARCHAR (6)     NULL,
    [CTY]                      VARCHAR (6)     NULL,
    [DETAIL_REF]               VARCHAR (10)    NULL,
    [DISP_VOLUME]              NUMERIC (19, 2) NULL,
    [ERROR_OVERRIDE]           VARCHAR (3)     NULL,
    [EXEMPTION_TYPE]           VARCHAR (4)     NULL,
    [FIELD]                    VARCHAR (5)     NULL,
    [FILER_NO]                 VARCHAR (6)     NULL,
    [FILER_TAXID]              VARCHAR (13)    NULL,
    [FORM]                     VARCHAR (9)     NULL,
    [GAS_CERTIFICATION]        VARCHAR (4)     NULL,
    [GAS_CONTINUITY]           VARCHAR (4)     NULL,
    [GAS_RATE_CODE]            VARCHAR (4)     NULL,
    [GRAVITY]                  VARCHAR (6)     NULL,
    [KIND_CODE]                VARCHAR (4)     NULL,
    [LEASE_NO]                 VARCHAR (15)    NULL,
    [LEASE_VALUE]              NUMERIC (19, 2) NULL,
    [LEASE_VOLUME]             NUMERIC (19, 2) NULL,
    [MEAS_METHOD]              VARCHAR (4)     NULL,
    [OFF_LEASE_FLAG]           VARCHAR (3)     NULL,
    [OGRID_NO]                 VARCHAR (6)     NULL,
    [OG_SALE_ID]               VARCHAR (10)    NULL,
    [OIL_CERTIFICATION]        VARCHAR (4)     NULL,
    [OIL_CONTINUITY]           VARCHAR (4)     NULL,
    [OIL_RATE_CODE]            VARCHAR (4)     NULL,
    [OPERATOR]                 VARCHAR (10)    NULL,
    [OVERRIDE_TAX_ID]          VARCHAR (7)     NULL,
    [PLANT]                    VARCHAR (5)     NULL,
    [PRIMARY_EDI_FORM]         VARCHAR (4)     NULL,
    [PRIMARY_STFILE_ID]        VARCHAR (33)    NULL,
    [PRIMARY_STFILE_LINE_NO]   VARCHAR (7)     NULL,
    [PRODUCER]                 VARCHAR (10)    NULL,
    [PRODUCER_CODE]            VARCHAR (8)     NULL,
    [PRODUCER_WELL_NO]         VARCHAR (8)     NULL,
    [PROD_BEGIN]               DATETIME        NULL,
    [PROD_DAYS]                VARCHAR (4)     NULL,
    [PROD_END]                 DATETIME        NULL,
    [PROD_METHOD]              VARCHAR (4)     NULL,
    [PROD_PERIOD]              DATETIME        NULL,
    [PROPERTY]                 VARCHAR (15)    NULL,
    [PURCHASER]                VARCHAR (10)    NULL,
    [PURCHASER_CODE]           VARCHAR (9)     NULL,
    [QUALITY]                  VARCHAR (7)     NULL,
    [RATE_CODE]                VARCHAR (4)     NULL,
    [REPORT_DATE]              DATETIME        NULL,
    [REPORT_REF]               VARCHAR (10)    NULL,
    [RPT_STATE]                VARCHAR (3)     NULL,
    [RR_ESTIMATE_ID]           VARCHAR (20)    NULL,
    [RVSL_ID]                  VARCHAR (10)    NULL,
    [RV_ACCTG_PERIOD]          DATETIME        NULL,
    [RV_PRD_CAT]               VARCHAR (3)     NULL,
    [SCHEDULE_]                VARCHAR (8)     NULL,
    [SECONDARY_STFILE_ID]      VARCHAR (33)    NULL,
    [SECONDARY_STFILE_LINE_NO] VARCHAR (7)     NULL,
    [SOURCE_SYSTEM]            VARCHAR (3)     NULL,
    [STATE]                    VARCHAR (2)     NULL,
    [STATE_FILE_STATUS]        VARCHAR (4)     NULL,
    [STATE_LEASE]              VARCHAR (12)    NULL,
    [STATE_LEASE_CTY]          VARCHAR (6)     NULL,
    [STATE_LEASE_CTY_NAME]     VARCHAR (25)    NULL,
    [STATE_LEASE_NAME]         VARCHAR (30)    NULL,
    [STATE_LEASE_NO]           VARCHAR (10)    NULL,
    [STATE_LEASE_TYPE]         VARCHAR (6)     NULL,
    [STATE_OPR_NO]             VARCHAR (10)    NULL,
    [STATE_OPR_TAXID]          VARCHAR (15)    NULL,
    [STATE_PRD]                VARCHAR (6)     NULL,
    [STATE_PRD_DESC]           VARCHAR (25)    NULL,
    [STATE_PRODUCT]            VARCHAR (6)     NULL,
    [STATUS]                   VARCHAR (3)     NULL,
    [STFILE_ACCTG_DATE]        VARCHAR (6)     NULL,
    [STFILE_COMPANY]           VARCHAR (4)     NULL,
    [STFILE_CREATE_DATE]       VARCHAR (8)     NULL,
    [STFILE_CREATE_TIME]       VARCHAR (8)     NULL,
    [TAXPAYER_CODE]            VARCHAR (8)     NULL,
    [TAXPAYER_NO]              VARCHAR (8)     NULL,
    [TAXPAYER_TAXID]           VARCHAR (12)    NULL,
    [TAX_DUE_FLAG]             VARCHAR (3)     NULL,
    [TRANSPORTER]              VARCHAR (10)    NULL,
    [TRANS_CODE]               VARCHAR (3)     NULL,
    [WELL_CLASS]               VARCHAR (5)     NULL,
    [WELL_PAYOUT]              NUMERIC (19, 2) NULL,
    [WELL_SERIAL_NO]           VARCHAR (9)     NULL,
    [time_stamp]               DATETIME        NULL,
    [u2_checksum]              VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

