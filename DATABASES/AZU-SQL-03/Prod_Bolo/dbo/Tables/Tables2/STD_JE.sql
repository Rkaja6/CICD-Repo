CREATE TABLE [dbo].[STD_JE] (
    [u2_id]                VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]         DATETIME        NULL,
    [ACTIVITY_DATE]        DATETIME        NULL,
    [AUTO_REVERSE_FLAG]    VARCHAR (7)     NULL,
    [BALANCE]              NUMERIC (19, 2) NULL,
    [COMPANY]              VARCHAR (3)     NULL,
    [CONTROL_TOTAL]        NUMERIC (19, 2) NULL,
    [DESCRIPTION]          VARCHAR (55)    NULL,
    [REVERSAL_VOUCHER]     VARCHAR (12)    NULL,
    [STD_JE_NO]            VARCHAR (7)     NULL,
    [SYSTEM_DATE]          DATETIME        NULL,
    [SYSTEM_TIME]          VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]       VARCHAR (7)     NULL,
    [TOTAL_DEBITS_ENTERED] NUMERIC (19, 2) NULL,
    [TYPE]                 VARCHAR (3)     NULL,
    [VOUCHER]              VARCHAR (7)     NULL,
    [VOUCHER_NO]           VARCHAR (7)     NULL,
    [VOUCHER_SOURCE]       VARCHAR (8)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

