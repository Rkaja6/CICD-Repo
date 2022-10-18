CREATE TABLE [dbo].[UPLOAD_NAMEX] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CNV_CTR]     VARCHAR (3)   NULL,
    [CNV_NAME_ID] VARCHAR (15)  NULL,
    [CNV_PREFIX]  VARCHAR (13)  NULL,
    [CNV_SITE]    VARCHAR (4)   NULL,
    [FINAL_GW_ID] VARCHAR (9)   NULL,
    [GW_NAME_ID]  VARCHAR (9)   NULL,
    [GW_SITE]     VARCHAR (4)   NULL,
    [ID]          VARCHAR (126) NULL,
    [SOURCE_ID]   VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

