CREATE TABLE [dbo].[AR_OG_SALES] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [COMPANY]              VARCHAR (5)   NULL,
    [CONTRACT]             VARCHAR (10)  NULL,
    [COST_CENTER]          VARCHAR (15)  NULL,
    [CO_CC_PROD_SALE_DATE] VARCHAR (20)  NULL,
    [PRODUCT]              VARCHAR (4)   NULL,
    [SALE_DATE]            DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

