CREATE TABLE [dbo].[BUG] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [REPLICATE_BY]        VARCHAR (9)   NULL,
    [REPLICATE_DATE]      DATETIME      NULL,
    [SERVER_REL_NO_FIXED] VARCHAR (14)  NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

