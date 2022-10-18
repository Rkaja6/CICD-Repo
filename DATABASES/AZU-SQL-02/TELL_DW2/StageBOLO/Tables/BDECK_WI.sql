CREATE TABLE [StageBOLO].[BDECK_WI] (
    [BDECK_WI_ID]       VARCHAR (255)   NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [PARENT_DECK]       VARCHAR (6)     NULL,
    [WI_DISP_FLAGS]     VARCHAR (4)     NULL,
    [WI_EFF_DATES]      DATETIME        NULL,
    [WI_EFF_SESSIONS]   VARCHAR (7)     NULL,
    [WI_EXP_DATES]      DATETIME        NULL,
    [WI_EXP_SESSIONS]   VARCHAR (7)     NULL,
    [WI_OWNERS]         VARCHAR (10)    NULL,
    [WORKING_INTERESTS] NUMERIC (19, 8) NULL,
    [time_stamp]        DATETIME        NULL
);

