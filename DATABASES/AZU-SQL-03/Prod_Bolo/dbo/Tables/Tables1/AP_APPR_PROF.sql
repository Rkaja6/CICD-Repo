CREATE TABLE [dbo].[AP_APPR_PROF] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [DEFAULT_ACCT_AUTH] VARCHAR (4)     NULL,
    [DEFAULT_CC_AUTH]   VARCHAR (4)     NULL,
    [DEFAULT_CO_AUTH]   VARCHAR (4)     NULL,
    [INVOICE_LIMIT]     NUMERIC (19, 2) NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

