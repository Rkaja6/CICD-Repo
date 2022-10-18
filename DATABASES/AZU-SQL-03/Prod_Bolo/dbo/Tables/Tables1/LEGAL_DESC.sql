CREATE TABLE [dbo].[LEGAL_DESC] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [BASIN]               VARCHAR (9)     NULL,
    [COUNTY]              VARCHAR (6)     NULL,
    [DESCRIPTION]         VARCHAR (30)    NULL,
    [DISTRICT]            VARCHAR (6)     NULL,
    [FIELD_ID]            VARCHAR (8)     NULL,
    [LAST_CHANGE_DATE]    DATETIME        NULL,
    [MAP_INDEX_OTHER]     VARCHAR (5)     NULL,
    [MERIDIAN]            VARCHAR (9)     NULL,
    [OTHER_LEGAL_DESC]    VARCHAR (3904)  NULL,
    [PROSPECT]            VARCHAR (6)     NULL,
    [PROSPECT_INDEX]      VARCHAR (8)     NULL,
    [SHADOW_KEY]          VARCHAR (6)     NULL,
    [STATE]               VARCHAR (2)     NULL,
    [SURFACE_GROSS_ACRES] NUMERIC (19, 4) NULL,
    [SURVEY_METHOD]       VARCHAR (6)     NULL,
    [TYPE]                VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

