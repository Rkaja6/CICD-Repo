CREATE TABLE [dbo].[RVCTL] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (5)   NULL,
    [PRODUCT]     VARCHAR (5)   NULL,
    [STATE]       VARCHAR (2)   NULL,
    [TYPE]        VARCHAR (5)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

