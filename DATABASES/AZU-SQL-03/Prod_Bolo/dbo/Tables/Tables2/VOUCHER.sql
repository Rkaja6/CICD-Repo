CREATE TABLE [dbo].[VOUCHER] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [APPR]            VARCHAR (4)   NULL,
    [APPR_DATE]       DATETIME      NULL,
    [AT_STATUS]       VARCHAR (11)  NULL,
    [COMPANY]         VARCHAR (4)   NULL,
    [CONTROL_VOUCHER] VARCHAR (7)   NULL,
    [DESCRIPTION]     VARCHAR (109) NULL,
    [POST_BEGIN]      VARCHAR (10)  NULL,
    [POST_END]        VARCHAR (10)  NULL,
    [SOURCE_TABLE]    VARCHAR (15)  NULL,
    [STATUS]          VARCHAR (11)  NULL,
    [SYSTEM_DATE]     DATETIME      NULL,
    [SYSTEM_TIME]     VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]  VARCHAR (6)   NULL,
    [VOUCHER]         VARCHAR (24)  NULL,
    [VOUCHER_REF]     VARCHAR (24)  NULL,
    [VOU_NO]          VARCHAR (16)  NULL,
    [VOU_SRC]         VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

