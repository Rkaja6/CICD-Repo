CREATE TABLE [dbo].[FDEFS_DATA_DICT] (
    [FDEFS_DATA_DICT_ID] VARCHAR (255)  NOT NULL,
    [u2_id]              VARCHAR (255)  NULL,
    [ASSOC]              VARCHAR (20)   NULL,
    [ATTR]               VARCHAR (3)    NULL,
    [ATTR_DESC]          VARCHAR (2114) NULL,
    [ATTR_NAME]          VARCHAR (41)   NULL,
    [ATTR_TYPE]          VARCHAR (3)    NULL,
    [FORMAT]             VARCHAR (4)    NULL,
    [HEADING]            VARCHAR (41)   NULL,
    [ODS_COMMENT]        VARCHAR (119)  NULL,
    [ODS_EXTRACT_SCRIPT] VARCHAR (18)   NULL,
    [OVERRIDE_SQL_TABLE] VARCHAR (24)   NULL,
    [PRIVATE_FLAG]       VARCHAR (7)    NULL,
    [PROJECT]            VARCHAR (23)   NULL,
    [REPLICATE_FLAG]     VARCHAR (9)    NULL,
    [SQL_NAME]           VARCHAR (41)   NULL,
    [SUB_ASSOC]          VARCHAR (24)   NULL,
    [time_stamp]         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FDEFS_DATA_DICT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FDEFS_DATA_DICT_u2_id_in]
    ON [dbo].[FDEFS_DATA_DICT]([u2_id] ASC);

