CREATE TABLE [dbo].[UPR_RPT] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [AGENCY_STATUS]  VARCHAR (6)     NULL,
    [AP_INV_ID]      VARCHAR (25)    NULL,
    [AR_ADJ_ID]      VARCHAR (8)     NULL,
    [COST_CENTER]    VARCHAR (6)     NULL,
    [CPT_AMT]        NUMERIC (19, 2) NULL,
    [ID]             VARCHAR (126)   NULL,
    [OWNER]          VARCHAR (9)     NULL,
    [OWNER_AGENCY]   VARCHAR (6)     NULL,
    [PROPERTY]       VARCHAR (15)    NULL,
    [REPORT_AGENCY]  VARCHAR (6)     NULL,
    [REPORT_COMPANY] VARCHAR (4)     NULL,
    [SALE_AMT]       NUMERIC (19, 2) NULL,
    [SALE_DATE]      DATETIME        NULL,
    [SOURCE_COMPANY] VARCHAR (4)     NULL,
    [VOUCHER]        VARCHAR (16)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

