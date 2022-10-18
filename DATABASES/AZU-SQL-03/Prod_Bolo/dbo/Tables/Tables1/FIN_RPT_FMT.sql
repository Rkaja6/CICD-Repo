CREATE TABLE [dbo].[FIN_RPT_FMT] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [COMPLETE_FLAG]      VARCHAR (8)   NULL,
    [CSV_COL_HDR]        VARCHAR (4)   NULL,
    [DESCRIPTION]        VARCHAR (65)  NULL,
    [DRILL_DOWN_ENABLED] VARCHAR (10)  NULL,
    [FIRST_PRINT_LEVEL]  VARCHAR (11)  NULL,
    [FONT_SIZE]          VARCHAR (4)   NULL,
    [LIST_TABLE]         VARCHAR (11)  NULL,
    [MENU_TYPE]          VARCHAR (4)   NULL,
    [SUPPRESS_FLAG]      VARCHAR (8)   NULL,
    [TEMPLATE]           VARCHAR (8)   NULL,
    [VRSION]             VARCHAR (7)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

