CREATE TABLE [dbo].[ANALYST_SELECT] (
    [u2_id]                      VARCHAR (255) NOT NULL,
    [ID]                         VARCHAR (126) NULL,
    [OVR_PURCHASER_VOUCHER_FLAG] VARCHAR (3)   NULL,
    [SELECT_FILE]                VARCHAR (20)  NULL,
    [SUB_SYSTEM]                 VARCHAR (5)   NULL,
    [time_stamp]                 DATETIME      NULL,
    [u2_checksum]                VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

