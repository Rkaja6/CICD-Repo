CREATE TABLE [dbo].[VOU_SRC_PROF] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [BEGIN_VOUCHER_NO] VARCHAR (8)   NULL,
    [COMPANY]          VARCHAR (3)   NULL,
    [VOU_SRC]          VARCHAR (3)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

