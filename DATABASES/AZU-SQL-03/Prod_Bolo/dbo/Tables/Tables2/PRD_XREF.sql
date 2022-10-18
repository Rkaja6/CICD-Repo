CREATE TABLE [dbo].[PRD_XREF] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [DISP]             VARCHAR (8)   NULL,
    [PRD_DESC]         VARCHAR (30)  NULL,
    [PROD_CAT]         VARCHAR (4)   NULL,
    [PROD_UPDATE_FLAG] VARCHAR (4)   NULL,
    [SALE_UPDATE_FLAG] VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

