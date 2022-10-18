CREATE TABLE [dbo].[CC_HIER] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [AUTO_MAINTAIN_FLAG] VARCHAR (5)   NULL,
    [CC_CATEGORIES]      VARCHAR (16)  NULL,
    [DESCRIPTION]        VARCHAR (57)  NULL,
    [EFF_DATE]           DATETIME      NULL,
    [EXP_DATE]           DATETIME      NULL,
    [REBUILD_REQ]        VARCHAR (7)   NULL,
    [SETUP_FLAG]         VARCHAR (5)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

