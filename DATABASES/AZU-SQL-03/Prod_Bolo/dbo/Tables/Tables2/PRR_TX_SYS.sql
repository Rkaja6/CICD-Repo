CREATE TABLE [dbo].[PRR_TX_SYS] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [AUTH_AGENT]         VARCHAR (21)  NULL,
    [CONTACT_EMAIL]      VARCHAR (25)  NULL,
    [CONTACT_NAME]       VARCHAR (21)  NULL,
    [CONTACT_PHONE]      VARCHAR (12)  NULL,
    [CONTACT_USER_ID]    VARCHAR (10)  NULL,
    [EDI_FILE_NAME]      VARCHAR (35)  NULL,
    [STATE_OPERATOR_NO]  VARCHAR (8)   NULL,
    [WET_DRY_RPTG_BASIS] VARCHAR (5)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

