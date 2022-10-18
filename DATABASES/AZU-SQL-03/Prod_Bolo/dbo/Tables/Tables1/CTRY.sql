CREATE TABLE [dbo].[CTRY] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [IRS_CODE]    VARCHAR (4)   NULL,
    [NAME]        VARCHAR (32)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

