CREATE TABLE [dbo].[BANK_DATA_CTL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (7)   NULL,
    [STMT_DATE]   DATETIME      NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

