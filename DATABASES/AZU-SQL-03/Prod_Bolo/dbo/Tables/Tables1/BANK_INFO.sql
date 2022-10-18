CREATE TABLE [dbo].[BANK_INFO] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ABA_NO]      VARCHAR (9)   NULL,
    [SWIFT_BIC]   VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

