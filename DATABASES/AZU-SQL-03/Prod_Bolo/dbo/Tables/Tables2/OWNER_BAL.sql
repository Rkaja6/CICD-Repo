CREATE TABLE [dbo].[OWNER_BAL] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [COMPANY]          VARCHAR (3)   NULL,
    [COST_CENTER]      VARCHAR (10)  NULL,
    [GATHERING_SYSTEM] VARCHAR (8)   NULL,
    [OWNER]            VARCHAR (10)  NULL,
    [PRODUCT_CATEGORY] VARCHAR (2)   NULL,
    [PROD_CAT]         VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

