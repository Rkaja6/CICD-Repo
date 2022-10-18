CREATE TABLE [dbo].[JUR_TAX_TABLE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (4)   NULL,
    [JUR_CODE]    VARCHAR (6)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

