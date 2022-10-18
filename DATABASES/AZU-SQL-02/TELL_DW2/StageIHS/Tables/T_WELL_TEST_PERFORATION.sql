﻿CREATE TABLE [StageIHS].[T_WELL_TEST_PERFORATION] (
    [UWI]                           VARCHAR (200)   NOT NULL,
    [SOURCE]                        VARCHAR (200)   NOT NULL,
    [TEST_TYPE]                     VARCHAR (200)   NOT NULL,
    [TOP_FORMATION_NAME]            VARCHAR (800)   NULL,
    [BASE_FORMATION_NAME]           VARCHAR (800)   NULL,
    [PRODFIT_FORMATION_TOP_NAME]    VARCHAR (800)   NULL,
    [PRODFIT_FORMATION_BASE_NAME]   VARCHAR (800)   NULL,
    [TEST_NUMBER]                   VARCHAR (200)   NOT NULL,
    [NUMBER]                        INT             NOT NULL,
    [DEPTH_TOP]                     DECIMAL (10, 5) NULL,
    [DEPTH_BASE]                    DECIMAL (10, 5) NULL,
    [LAT_LEN_HORIZ_DISPLACEMENT_FT] INT             NULL,
    [LAT_LEN_GROSS_PERF_INTVL]      DECIMAL (10, 5) NULL,
    [PROD_METHOD]                   VARCHAR (800)   NULL,
    [CADIS_SYSTEM_INSERTED]         DATETIME        NULL,
    [CADIS_SYSTEM_UPDATED]          DATETIME        NULL,
    [CADIS_SYSTEM_CHANGEDBY]        NVARCHAR (800)  NULL,
    [CADIS_SYSTEM_TIMESTAMP]        VARBINARY (50)  NULL,
    [CADIS_SYSTEM_RUNID]            INT             NOT NULL,
    [CADIS_SYSTEM_TOPRUNID]         INT             NOT NULL,
    CONSTRAINT [PK_T_WELL_TEST_PERFORATION] PRIMARY KEY CLUSTERED ([UWI] ASC, [SOURCE] ASC, [TEST_TYPE] ASC, [TEST_NUMBER] ASC, [NUMBER] ASC)
);

