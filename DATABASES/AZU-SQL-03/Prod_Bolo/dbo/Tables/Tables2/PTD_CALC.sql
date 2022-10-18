CREATE TABLE [dbo].[PTD_CALC] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [COST_CENTER] VARCHAR (12)  NULL,
    [PROPERTY]    VARCHAR (12)  NULL,
    [STATE]       VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

