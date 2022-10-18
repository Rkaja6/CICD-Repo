CREATE TABLE [dbo].[METER_FORM] (
    [u2_id]         VARCHAR (255)   NOT NULL,
    [DESCRIPTION]   VARCHAR (37)    NULL,
    [FORMULA]       VARCHAR (126)   NULL,
    [PRESSURE_BASE] NUMERIC (19, 4) NULL,
    [RULE_ID]       VARCHAR (102)   NULL,
    [TEST_DATE]     DATETIME        NULL,
    [TEST_FACILITY] VARCHAR (8)     NULL,
    [TEST_PRODUCT]  VARCHAR (4)     NULL,
    [TEST_RESULT]   NUMERIC (19, 2) NULL,
    [WET_DRY_FLAG]  VARCHAR (4)     NULL,
    [time_stamp]    DATETIME        NULL,
    [u2_checksum]   VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

