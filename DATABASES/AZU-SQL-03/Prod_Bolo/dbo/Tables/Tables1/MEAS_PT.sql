﻿CREATE TABLE [dbo].[MEAS_PT] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [ALLOC_METHOD]        VARCHAR (10)  NULL,
    [ALLOC_METHOD_RULE]   VARCHAR (4)   NULL,
    [DESCRIPTION]         VARCHAR (10)  NULL,
    [DISP]                VARCHAR (9)   NULL,
    [FACILITY]            VARCHAR (8)   NULL,
    [GATHERING_SYSTEM]    VARCHAR (8)   NULL,
    [INACTIVE_DATE]       DATETIME      NULL,
    [METER]               VARCHAR (12)  NULL,
    [PARENT_MEAS_PT]      VARCHAR (12)  NULL,
    [PARENT_MEAS_PT_FLAG] VARCHAR (11)  NULL,
    [PARENT_MP]           VARCHAR (7)   NULL,
    [PIPELINE]            VARCHAR (8)   NULL,
    [PRD_PRODUCT]         VARCHAR (7)   NULL,
    [PRODUCT]             VARCHAR (7)   NULL,
    [PURCHASER]           VARCHAR (9)   NULL,
    [PURCHASER_METER]     VARCHAR (9)   NULL,
    [ROLLUP_MEAS_PT]      VARCHAR (11)  NULL,
    [SUB_SYSTEM]          VARCHAR (6)   NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

