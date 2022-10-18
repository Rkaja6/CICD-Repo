CREATE TABLE [dbo].[TERMS] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [CALC_BASIS]     VARCHAR (5)     NULL,
    [DAYS_UNTIL_DUE] VARCHAR (5)     NULL,
    [DESCRIPTION]    VARCHAR (34)    NULL,
    [DFLT_SVC_CHG]   NUMERIC (19, 3) NULL,
    [DISC_PCT]       NUMERIC (19, 3) NULL,
    [DISC_PERIOD]    VARCHAR (4)     NULL,
    [GRACE_PERIOD]   VARCHAR (6)     NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

