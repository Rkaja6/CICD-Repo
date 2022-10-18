CREATE TABLE [dbo].[JBCC_INFO] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [BILLING_CC]  VARCHAR (7)   NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

