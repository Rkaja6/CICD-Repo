CREATE TABLE [dbo].[WELL_INFO_LBL_FMT] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (36)  NULL,
    [DFLT_LABEL_FMT] VARCHAR (8)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

