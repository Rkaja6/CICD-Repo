CREATE TABLE [dbo].[MMS_WELL_STATUS] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [ACTION_CODE_FLAG]     VARCHAR (6)   NULL,
    [DESCRIPTION]          VARCHAR (45)  NULL,
    [DFLT_COMPLETION_CODE] VARCHAR (8)   NULL,
    [DOWN_FLAG]            VARCHAR (4)   NULL,
    [OFFSHORE_FLAG]        VARCHAR (8)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

