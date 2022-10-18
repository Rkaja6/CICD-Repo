CREATE TABLE [dbo].[PRR_WY_SYS] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [CONTACT_NAME]      VARCHAR (30)  NULL,
    [CONTACT_PHONE]     VARCHAR (12)  NULL,
    [EDI_FILE_NAME]     VARCHAR (35)  NULL,
    [STATE_OPERATOR_NO] VARCHAR (4)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

