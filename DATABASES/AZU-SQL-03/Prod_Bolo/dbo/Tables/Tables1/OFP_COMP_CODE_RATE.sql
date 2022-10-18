CREATE TABLE [dbo].[OFP_COMP_CODE_RATE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CODE]        VARCHAR (6)   NULL,
    [DRIVER]      VARCHAR (6)   NULL,
    [RATE_TYPE]   VARCHAR (3)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

