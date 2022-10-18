CREATE TABLE [dbo].[JBCTL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [TYPE]        VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

