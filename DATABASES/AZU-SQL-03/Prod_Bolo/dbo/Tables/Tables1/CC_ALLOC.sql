CREATE TABLE [dbo].[CC_ALLOC] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [COST_CENTER] VARCHAR (6)   NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [PRODUCT]     VARCHAR (3)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

