CREATE TABLE [dbo].[PROD_DISP] (
    [u2_id]                    VARCHAR (255) NOT NULL,
    [ALLOCATE_FLAG]            VARCHAR (8)   NULL,
    [BEGIN_INVENTORY_ADJ_FLAG] VARCHAR (9)   NULL,
    [BSW_FLAG]                 VARCHAR (4)   NULL,
    [COMMENT_FLAG]             VARCHAR (7)   NULL,
    [CONNECTION_TYPE]          VARCHAR (10)  NULL,
    [DESCRIPTION]              VARCHAR (40)  NULL,
    [HOW_USED]                 VARCHAR (4)   NULL,
    [INJECTION_FLAG]           VARCHAR (9)   NULL,
    [INVENTORY_FLAG]           VARCHAR (9)   NULL,
    [MEMO_FLAG]                VARCHAR (4)   NULL,
    [OUTPUT_FLAG]              VARCHAR (9)   NULL,
    [PROD_FLAG]                VARCHAR (4)   NULL,
    [SALE_FLAG]                VARCHAR (4)   NULL,
    [SETUP_DISABLED_FLAG]      VARCHAR (7)   NULL,
    [SHRINK_PROD_VOL_FLAG]     VARCHAR (8)   NULL,
    [WATER_DRAW_FLAG]          VARCHAR (5)   NULL,
    [WELLHEAD_VOL_FLAG]        VARCHAR (8)   NULL,
    [time_stamp]               DATETIME      NULL,
    [u2_checksum]              VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

