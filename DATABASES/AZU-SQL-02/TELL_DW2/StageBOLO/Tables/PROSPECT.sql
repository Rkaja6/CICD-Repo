CREATE TABLE [StageBOLO].[PROSPECT] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [ACQUISITION]         VARCHAR (11)  NULL,
    [BASIN]               VARCHAR (5)   NULL,
    [CC_TYPE]             VARCHAR (5)   NULL,
    [COUNTY]              VARCHAR (7)   NULL,
    [DISTRICT]            VARCHAR (8)   NULL,
    [FIELD_ID]            VARCHAR (10)  NULL,
    [LEGAL_DESC_ID]       VARCHAR (13)  NULL,
    [MERIDIAN]            VARCHAR (8)   NULL,
    [MERIDIANS]           VARCHAR (8)   NULL,
    [NAME]                VARCHAR (68)  NULL,
    [OPERATOR]            VARCHAR (8)   NULL,
    [OTHER_LEGAL_DESC]    VARCHAR (50)  NULL,
    [SHADOW_KEY]          VARCHAR (12)  NULL,
    [STATE]               VARCHAR (2)   NULL,
    [SURVEY_METHOD]       VARCHAR (6)   NULL,
    [TERMINATION_DATE]    DATETIME      NULL,
    [TERMINATION_REMARKS] VARCHAR (185) NULL,
    [TERMINATION_TYPE]    VARCHAR (11)  NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL
);

