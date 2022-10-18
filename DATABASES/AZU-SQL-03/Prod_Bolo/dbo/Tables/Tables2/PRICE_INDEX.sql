CREATE TABLE [dbo].[PRICE_INDEX] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [PRICE_INDEXX]    VARCHAR (38)  NULL,
    [PRICE_METHOD]    VARCHAR (38)  NULL,
    [PRICE_METHOD_ID] VARCHAR (38)  NULL,
    [SALE_DATE]       DATETIME      NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

