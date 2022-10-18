CREATE TABLE [dbo].[AP_DOCVUE_RPT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANYNO]   VARCHAR (10)  NULL,
    [INVOICENO]   VARCHAR (30)  NULL,
    [VENDORNO]    VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

