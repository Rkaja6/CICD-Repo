CREATE TABLE [dbo].[WELL_TYPE] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [CYCLIC_FLAG]    VARCHAR (6)   NULL,
    [DESCRIPTION]    VARCHAR (31)  NULL,
    [INJECTION_FLAG] VARCHAR (9)   NULL,
    [PRD_CATEGORY]   VARCHAR (7)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

