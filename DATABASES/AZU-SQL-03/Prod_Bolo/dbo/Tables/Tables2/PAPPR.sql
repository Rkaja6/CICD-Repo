CREATE TABLE [dbo].[PAPPR] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ACCTG_PERIOD] DATETIME      NULL,
    [APP]          VARCHAR (11)  NULL,
    [COMPANY]      VARCHAR (3)   NULL,
    [DOCUMENT]     VARCHAR (28)  NULL,
    [MV_POS]       NUMERIC (9)   NULL,
    [SYSTEM_DATE]  DATETIME      NULL,
    [SYSTEM_TIME]  VARCHAR (8)   NULL,
    [USR]          VARCHAR (15)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

