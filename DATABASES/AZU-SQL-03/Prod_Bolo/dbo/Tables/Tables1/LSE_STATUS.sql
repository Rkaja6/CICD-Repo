CREATE TABLE [dbo].[LSE_STATUS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (32)  NULL,
    [PAY_FLAG]       VARCHAR (6)   NULL,
    [PERPETUAL_FLAG] VARCHAR (4)   NULL,
    [PROD_STATUS]    VARCHAR (6)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

