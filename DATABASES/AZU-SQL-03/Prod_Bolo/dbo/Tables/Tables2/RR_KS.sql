CREATE TABLE [dbo].[RR_KS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DFLT_CPTS_FLAG] VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

