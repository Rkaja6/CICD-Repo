CREATE TABLE [dbo].[VOU_CTL] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ACCTG_PERIOD] DATETIME      NULL,
    [COMPANY]      VARCHAR (4)   NULL,
    [HIGH_NO]      VARCHAR (4)   NULL,
    [NEXT_NO]      VARCHAR (4)   NULL,
    [VOU_SRC]      VARCHAR (3)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

