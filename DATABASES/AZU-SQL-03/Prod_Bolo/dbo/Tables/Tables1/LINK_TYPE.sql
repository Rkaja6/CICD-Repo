CREATE TABLE [dbo].[LINK_TYPE] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [ACCESS_LOCKED]         VARCHAR (6)   NULL,
    [DB_ATTRIBUTE]          VARCHAR (15)  NULL,
    [DB_TABLE]              VARCHAR (8)   NULL,
    [DESCRIPTION]           VARCHAR (58)  NULL,
    [DIRECTORY]             VARCHAR (40)  NULL,
    [DOCUMENT_ENABLED]      VARCHAR (8)   NULL,
    [EXC_OPTIONS]           VARCHAR (169) NULL,
    [EXC_PREFIX]            VARCHAR (57)  NULL,
    [EXT_STORE]             VARCHAR (5)   NULL,
    [KEY_ID]                VARCHAR (20)  NULL,
    [SRV_DIRECTORY]         VARCHAR (30)  NULL,
    [SRV_STAGING_DIRECTORY] VARCHAR (30)  NULL,
    [STAGING_DIRECTORY]     VARCHAR (24)  NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

