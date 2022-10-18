CREATE TABLE [dbo].[PRR_NM_SYS] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [CONTACT_EMAIL]      VARCHAR (25)  NULL,
    [CONTACT_PHONE]      VARCHAR (12)  NULL,
    [CONTACT_USER_ID]    VARCHAR (10)  NULL,
    [EDI_FILE_NAME]      VARCHAR (35)  NULL,
    [OPERATOR]           VARCHAR (8)   NULL,
    [RPTG_PRESSURE_BASE] VARCHAR (8)   NULL,
    [RPTG_WET_DRY_BASIS] VARCHAR (5)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

