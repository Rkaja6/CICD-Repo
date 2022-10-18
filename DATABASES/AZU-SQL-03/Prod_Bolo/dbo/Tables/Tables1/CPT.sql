CREATE TABLE [dbo].[CPT] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ABBREV]       VARCHAR (6)   NULL,
    [ADJ_TO_GROSS] VARCHAR (8)   NULL,
    [DESCRIPTION]  VARCHAR (78)  NULL,
    [NON_DIST]     VARCHAR (11)  NULL,
    [TYPE]         VARCHAR (4)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

