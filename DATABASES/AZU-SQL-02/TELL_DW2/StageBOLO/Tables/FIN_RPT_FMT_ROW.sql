CREATE TABLE [StageBOLO].[FIN_RPT_FMT_ROW] (
    [FIN_RPT_FMT_ROW_ID]         VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [NUMERIC_ROW_FLAGS]          VARCHAR (7)   NULL,
    [ROW_ACT_BUD_FLAGS]          VARCHAR (6)   NULL,
    [ROW_CONTROL_VALUES]         VARCHAR (19)  NULL,
    [ROW_CONVS]                  VARCHAR (5)   NULL,
    [ROW_DATA_TYPES]             VARCHAR (4)   NULL,
    [ROW_DATE_FORMULAS]          VARCHAR (20)  NULL,
    [ROW_FORMULAS]               VARCHAR (110) NULL,
    [ROW_FORMULA_OVERRIDE_FLAGS] VARCHAR (8)   NULL,
    [ROW_GROUPS]                 VARCHAR (5)   NULL,
    [ROW_HEADINGS]               VARCHAR (48)  NULL,
    [ROW_PRINT_OPTIONS]          VARCHAR (7)   NULL,
    [ROW_SUM_BUCKETS]            VARCHAR (6)   NULL,
    [ROW_TYPES]                  VARCHAR (4)   NULL,
    [time_stamp]                 DATETIME      NULL
);

