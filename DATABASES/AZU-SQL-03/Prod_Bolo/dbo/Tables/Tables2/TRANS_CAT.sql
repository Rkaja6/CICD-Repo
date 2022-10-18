CREATE TABLE [dbo].[TRANS_CAT] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [AT_ENABLED]            VARCHAR (7)   NULL,
    [AT_FLAG]               VARCHAR (4)   NULL,
    [CC_REQ]                VARCHAR (12)  NULL,
    [COA_ENABLED]           VARCHAR (4)   NULL,
    [CONV_CODE]             VARCHAR (7)   NULL,
    [COPAS_GRADING_ENABLED] VARCHAR (7)   NULL,
    [DESCRIPTION]           VARCHAR (40)  NULL,
    [DOMAIN_ID]             VARCHAR (6)   NULL,
    [FIELD_REQ]             VARCHAR (5)   NULL,
    [LABEL_]                VARCHAR (30)  NULL,
    [PATTERN_EDIT]          VARCHAR (7)   NULL,
    [REL_TABLE]             VARCHAR (10)  NULL,
    [REL_TABLE_DESC_AMC]    VARCHAR (7)   NULL,
    [TRANS_CODE_REQ]        VARCHAR (5)   NULL,
    [UOM1]                  VARCHAR (7)   NULL,
    [UOM2]                  VARCHAR (7)   NULL,
    [VALIDATION_REQ_FLAG]   VARCHAR (10)  NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

