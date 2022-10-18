CREATE TABLE [dbo].[USER_RPT_FMT] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [CASCADING_SELECT_FLAG] VARCHAR (9)   NULL,
    [COMPLETE_FLAG]         VARCHAR (8)   NULL,
    [DESCRIPTION]           VARCHAR (52)  NULL,
    [DRILL_DOWN_ENABLED]    VARCHAR (10)  NULL,
    [FIRST_PRINT_LEVEL]     VARCHAR (11)  NULL,
    [FONT_SIZE]             VARCHAR (4)   NULL,
    [LIST_TABLE]            VARCHAR (10)  NULL,
    [SUPPRESS_FLAG]         VARCHAR (8)   NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

