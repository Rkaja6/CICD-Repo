CREATE TABLE [dbo].[RIO_INJ_WELL_TEST] (
    [u2_id]        VARCHAR (255)   NOT NULL,
    [BOLO_WELL]    VARCHAR (9)     NULL,
    [CASING_PRESS] VARCHAR (15)    NULL,
    [CHOKE]        VARCHAR (5)     NULL,
    [COMMENT_]     VARCHAR (30)    NULL,
    [DATA_SOURCE]  VARCHAR (11)    NULL,
    [DIFF_PRESS]   VARCHAR (13)    NULL,
    [ID]           VARCHAR (126)   NULL,
    [INJ_DAYS]     VARCHAR (8)     NULL,
    [INJ_VOL]      NUMERIC (19, 2) NULL,
    [MOD_DATE]     DATETIME        NULL,
    [MOD_USER]     VARCHAR (8)     NULL,
    [PRODUCT]      VARCHAR (7)     NULL,
    [RIO_WELL]     VARCHAR (8)     NULL,
    [TEST_DATE]    DATETIME        NULL,
    [TUBING_PRESS] VARCHAR (15)    NULL,
    [time_stamp]   DATETIME        NULL,
    [u2_checksum]  VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

