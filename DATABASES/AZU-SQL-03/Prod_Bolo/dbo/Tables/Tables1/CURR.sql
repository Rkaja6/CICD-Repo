CREATE TABLE [dbo].[CURR] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ABS_POS]     VARCHAR (3)   NULL,
    [DESCRIPTION] VARCHAR (25)  NULL,
    [EXPAND]      VARCHAR (6)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

