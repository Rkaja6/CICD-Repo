CREATE TABLE [dbo].[PTRSHP_DIST_CONTROL] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ALLOC_DATE]   DATETIME      NULL,
    [ALLOC_TIME]   VARCHAR (7)   NULL,
    [ALLOC_USER]   VARCHAR (7)   NULL,
    [DIST_DATE]    DATETIME      NULL,
    [PTRSHP_NO]    VARCHAR (6)   NULL,
    [TRIAL_STATUS] VARCHAR (6)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

