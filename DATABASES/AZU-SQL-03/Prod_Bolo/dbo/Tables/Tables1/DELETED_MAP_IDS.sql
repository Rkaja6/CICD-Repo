CREATE TABLE [dbo].[DELETED_MAP_IDS] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DATE_DELETED] DATETIME      NULL,
    [DELETED_BY]   VARCHAR (8)   NULL,
    [LEASE]        VARCHAR (12)  NULL,
    [MAP_ID]       VARCHAR (3)   NULL,
    [TGS_DATE]     DATETIME      NULL,
    [TIME_DELETED] VARCHAR (8)   NULL,
    [TRACT_NO]     VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

