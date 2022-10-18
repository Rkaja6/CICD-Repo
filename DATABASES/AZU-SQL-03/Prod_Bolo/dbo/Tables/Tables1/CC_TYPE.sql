CREATE TABLE [dbo].[CC_TYPE] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [ALLOC_ENABLED]       VARCHAR (10)  NULL,
    [AT_ENABLED]          VARCHAR (7)   NULL,
    [CATEGORY]            VARCHAR (4)   NULL,
    [CC_TYPE_CODE]        VARCHAR (10)  NULL,
    [DESCRIPTION]         VARCHAR (42)  NULL,
    [ENG_WELL_COUNT_FLAG] VARCHAR (5)   NULL,
    [PUI_USAGE]           VARCHAR (10)  NULL,
    [REPORT_HEADING]      VARCHAR (24)  NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

