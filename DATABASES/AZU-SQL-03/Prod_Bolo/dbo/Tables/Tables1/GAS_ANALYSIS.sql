CREATE TABLE [dbo].[GAS_ANALYSIS] (
    [u2_id]            VARCHAR (255)   NOT NULL,
    [BASE_TEMP]        NUMERIC (9, 1)  NULL,
    [BTU_DRY]          NUMERIC (19, 4) NULL,
    [BTU_FACTOR]       NUMERIC (19, 4) NULL,
    [BTU_WET]          NUMERIC (19, 4) NULL,
    [CC_NO]            VARCHAR (15)    NULL,
    [COMPRESSIBILITY]  NUMERIC (19, 4) NULL,
    [COST_CENTER]      VARCHAR (8)     NULL,
    [GAS_HYDRO]        VARCHAR (7)     NULL,
    [GATHERING_SYSTEM] VARCHAR (11)    NULL,
    [GRAVITY]          NUMERIC (19, 3) NULL,
    [PERFORMED_BY]     VARCHAR (30)    NULL,
    [PRESSURE_BASE]    NUMERIC (19, 2) NULL,
    [REMARKS]          VARCHAR (107)   NULL,
    [TEST_DATE]        DATETIME        NULL,
    [WELL_NAME]        VARCHAR (25)    NULL,
    [time_stamp]       DATETIME        NULL,
    [u2_checksum]      VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

