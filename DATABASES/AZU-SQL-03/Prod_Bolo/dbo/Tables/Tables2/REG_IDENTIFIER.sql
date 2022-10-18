CREATE TABLE [dbo].[REG_IDENTIFIER] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [NAME_ID]         VARCHAR (7)   NULL,
    [OVERRIDE_TAX_ID] VARCHAR (11)  NULL,
    [STATE]           VARCHAR (3)   NULL,
    [STATE_CODE]      VARCHAR (10)  NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

