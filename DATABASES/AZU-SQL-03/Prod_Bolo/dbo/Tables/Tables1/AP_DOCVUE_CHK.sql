CREATE TABLE [dbo].[AP_DOCVUE_CHK] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [CHECK_AMT]      NUMERIC (19, 2) NULL,
    [CHECK_DATE]     DATETIME        NULL,
    [CHECK_NO]       VARCHAR (13)    NULL,
    [COMPANYNO]      VARCHAR (10)    NULL,
    [COMPANY_NAME]   VARCHAR (29)    NULL,
    [COMPANY_NO]     VARCHAR (10)    NULL,
    [INVOICENO]      VARCHAR (30)    NULL,
    [INVOICE_AMOUNT] NUMERIC (19, 2) NULL,
    [INVOICE_NO]     VARCHAR (30)    NULL,
    [TRIG_DATE]      DATETIME        NULL,
    [TRIG_TIME]      VARCHAR (8)     NULL,
    [UPDATE_DATE]    DATETIME        NULL,
    [UPDATE_TIME]    VARCHAR (7)     NULL,
    [VENDORNO]       VARCHAR (10)    NULL,
    [VENDOR_NAME]    VARCHAR (34)    NULL,
    [VENDOR_NO]      VARCHAR (10)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

