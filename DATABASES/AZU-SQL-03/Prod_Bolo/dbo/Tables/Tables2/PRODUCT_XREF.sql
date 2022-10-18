CREATE TABLE [dbo].[PRODUCT_XREF] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DAVE_PRODUCT] VARCHAR (7)   NULL,
    [DESCRIPTION]  VARCHAR (30)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

