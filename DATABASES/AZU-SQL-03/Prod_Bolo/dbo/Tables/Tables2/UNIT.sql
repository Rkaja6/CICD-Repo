CREATE TABLE [dbo].[UNIT] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [ACQUISITION]  VARCHAR (11)  NULL,
    [COMPANY]      VARCHAR (3)   NULL,
    [COST_CENTER]  VARCHAR (12)  NULL,
    [COUNTY]       VARCHAR (6)   NULL,
    [DESCRIPTION]  VARCHAR (30)  NULL,
    [DISTRICT]     VARCHAR (7)   NULL,
    [FIELD_ID]     VARCHAR (5)   NULL,
    [GROSS_ACRES]  VARCHAR (10)  NULL,
    [JOA]          VARCHAR (25)  NULL,
    [NAME]         VARCHAR (25)  NULL,
    [NET_ACRES]    VARCHAR (10)  NULL,
    [OPERATOR]     VARCHAR (8)   NULL,
    [PROSPECT]     VARCHAR (5)   NULL,
    [REMARKS]      VARCHAR (25)  NULL,
    [STATE]        VARCHAR (5)   NULL,
    [STATUS]       VARCHAR (5)   NULL,
    [UNIT_HISTORY] VARCHAR (25)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

