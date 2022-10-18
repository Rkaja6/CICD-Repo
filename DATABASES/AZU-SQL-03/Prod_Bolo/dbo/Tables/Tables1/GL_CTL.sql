CREATE TABLE [dbo].[GL_CTL] (
    [u2_id]                             VARCHAR (255) NOT NULL,
    [HIER_SETUP_FLAG]                   VARCHAR (5)   NULL,
    [SUMMARIZED_ALLOCATION_DESCRIPTION] VARCHAR (4)   NULL,
    [SUMMARIZE_ALLOCATIONS]             VARCHAR (5)   NULL,
    [time_stamp]                        DATETIME      NULL,
    [u2_checksum]                       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

