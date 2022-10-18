CREATE TABLE [dbo].[DM_CTL] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [AP_INVOICE_LINK_TYPE] VARCHAR (10)  NULL,
    [AP_INV_SCAN_ORDER]    VARCHAR (10)  NULL,
    [EARLIEST_AP_INV_DATE] DATETIME      NULL,
    [SCANNING_SOFTWARE]    VARCHAR (8)   NULL,
    [THIRD_PARTY_PROVIDER] VARCHAR (8)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

