CREATE TABLE [dbo].[OWNER_PRICE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (4)   NULL,
    [COST_CENTER] VARCHAR (15)  NULL,
    [OWNER]       VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

