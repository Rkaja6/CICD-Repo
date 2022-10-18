CREATE TABLE [dbo].[DM_QUERY_TEMPLATE] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [DOCUMENT_TYPE] VARCHAR (6)   NULL,
    [DSPLY_ID]      VARCHAR (11)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

