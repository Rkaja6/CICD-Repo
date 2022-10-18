CREATE TABLE [dbo].[PTRSHP_INVESTOR] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [ALT_FBO_ID]        VARCHAR (6)   NULL,
    [BROKER_ACCOUNT_NO] VARCHAR (20)  NULL,
    [CURR_BROKER]       VARCHAR (8)   NULL,
    [CURR_SALES_REP]    VARCHAR (8)   NULL,
    [MAIL_TO_ADDRESS]   VARCHAR (7)   NULL,
    [MAIL_TO_BANK]      VARCHAR (7)   NULL,
    [SEP_CHK]           VARCHAR (12)  NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

