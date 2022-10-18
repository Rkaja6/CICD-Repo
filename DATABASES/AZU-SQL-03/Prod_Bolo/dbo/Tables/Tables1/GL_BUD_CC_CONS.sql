CREATE TABLE [dbo].[GL_BUD_CC_CONS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ACCT]        VARCHAR (12)  NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [COST_CENTER] VARCHAR (12)  NULL,
    [HIER]        VARCHAR (10)  NULL,
    [HIERARCHY]   VARCHAR (9)   NULL,
    [UNUSED]      VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

