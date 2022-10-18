CREATE TABLE [dbo].[SUBSCRIPTION] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [BROKER_NO]            VARCHAR (9)   NULL,
    [ENTERED_BY]           VARCHAR (10)  NULL,
    [ENTERED_DATE]         VARCHAR (10)  NULL,
    [ENTITY]               VARCHAR (6)   NULL,
    [GP_LP_FLAG]           VARCHAR (5)   NULL,
    [INVESTMENT_AMT]       VARCHAR (14)  NULL,
    [INVESTOR]             VARCHAR (8)   NULL,
    [NET_ASSET_VALUE_FLAG] VARCHAR (5)   NULL,
    [SALES_REP_NO]         VARCHAR (8)   NULL,
    [UNITS]                VARCHAR (9)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

