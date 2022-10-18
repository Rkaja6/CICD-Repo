CREATE TABLE [dbo].[RV_AR] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [ACCT]                 VARCHAR (10)  NULL,
    [CO]                   VARCHAR (7)   NULL,
    [COMPANY]              VARCHAR (7)   NULL,
    [COST_CENTER]          VARCHAR (12)  NULL,
    [FINAL_RLSE_DATE]      DATETIME      NULL,
    [FINAL_RLSE_DATE_QTY1] DATETIME      NULL,
    [FINAL_RLSE_DATE_QTY2] DATETIME      NULL,
    [INVOICE_INDEX]        VARCHAR (7)   NULL,
    [PROPERTY]             VARCHAR (12)  NULL,
    [REMITTER]             VARCHAR (8)   NULL,
    [SALE_DATE]            DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

