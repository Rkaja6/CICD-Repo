CREATE TABLE [dbo].[ACCTG_PERIOD] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [BEGIN_DATE]  DATETIME      NULL,
    [CLOSE_DATE]  DATETIME      NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [END_DATE]    DATETIME      NULL,
    [OPEN_DATE]   DATETIME      NULL,
    [PERIOD]      VARCHAR (4)   NULL,
    [YEAR_NO]     VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

