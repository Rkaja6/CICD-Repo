CREATE TABLE [dbo].[ROY_NM_DET] (
    [u2_id]              VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]       DATETIME        NULL,
    [APP]                VARCHAR (10)    NULL,
    [ARMS_LENGTH_FLAG]   VARCHAR (4)     NULL,
    [BTU]                NUMERIC (9)     NULL,
    [COMPANY]            VARCHAR (3)     NULL,
    [CREDIT_AMT]         NUMERIC (19, 2) NULL,
    [CREDIT_INVOICE]     VARCHAR (11)    NULL,
    [EDI_DATE]           DATETIME        NULL,
    [EDI_FILE]           VARCHAR (35)    NULL,
    [INTEREST]           NUMERIC (19, 2) NULL,
    [LEASE]              VARCHAR (10)    NULL,
    [LEASE_VALUE]        NUMERIC (19, 2) NULL,
    [LEASE_VOLUME]       NUMERIC (19, 2) NULL,
    [MARKET_DEDUCT]      NUMERIC (19, 2) NULL,
    [NGL_CREDIT]         NUMERIC (19, 2) NULL,
    [OWNER_SALE_ID]      VARCHAR (9)     NULL,
    [PROCESS_DEDUCT]     NUMERIC (19, 2) NULL,
    [PRODUCT]            VARCHAR (4)     NULL,
    [PROJECTED_PAY_DATE] DATETIME        NULL,
    [PUN]                VARCHAR (7)     NULL,
    [ROYALTY_VALUE]      NUMERIC (19, 2) NULL,
    [RVSL_ID]            VARCHAR (7)     NULL,
    [SALE_DATE]          DATETIME        NULL,
    [STATUS]             VARCHAR (4)     NULL,
    [TRANSPORT_DEDUCT]   NUMERIC (19, 2) NULL,
    [TRANS_CODE]         VARCHAR (4)     NULL,
    [time_stamp]         DATETIME        NULL,
    [u2_checksum]        VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

