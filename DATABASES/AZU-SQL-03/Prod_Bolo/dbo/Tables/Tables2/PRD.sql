CREATE TABLE [dbo].[PRD] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [CDX_PRD]          VARCHAR (4)   NULL,
    [DESCRIPTION]      VARCHAR (36)  NULL,
    [PRODUCT_CATEGORY] VARCHAR (4)   NULL,
    [QTY1]             VARCHAR (4)   NULL,
    [QTY2]             VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

