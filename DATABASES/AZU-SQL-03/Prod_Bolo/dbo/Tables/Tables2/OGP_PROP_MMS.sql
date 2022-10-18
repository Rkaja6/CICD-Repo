CREATE TABLE [dbo].[OGP_PROP_MMS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [API_NO]         VARCHAR (15)  NULL,
    [COMPANY]        VARCHAR (3)   NULL,
    [CONTRACT]       VARCHAR (10)  NULL,
    [PRODUCT]        VARCHAR (4)   NULL,
    [PROPERTY]       VARCHAR (15)  NULL,
    [PROPERTY_NO]    VARCHAR (13)  NULL,
    [SALE_MONTH_LAG] VARCHAR (3)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

