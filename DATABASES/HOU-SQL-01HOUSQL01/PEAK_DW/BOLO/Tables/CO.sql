﻿CREATE TABLE [BOLO].[CO] (
    [u2_id]                       VARCHAR (255) NULL,
    [ACTUALS_DATE]                DATETIME      NULL,
    [ALLOC_ACCTG_PERIOD_EDIT]     VARCHAR (5)   NULL,
    [ALLOC_VOU_APP]               VARCHAR (10)  NULL,
    [ALLOC_VOU_SRC]               VARCHAR (5)   NULL,
    [CURR_RND_ERR_ACCT]           VARCHAR (9)   NULL,
    [CURR_VOU_APP]                VARCHAR (11)  NULL,
    [CURR_VOU_SRC]                VARCHAR (9)   NULL,
    [DOM_CURR]                    VARCHAR (8)   NULL,
    [GENERIC_COA_FLAG]            VARCHAR (7)   NULL,
    [INTERCO_POST]                VARCHAR (3)   NULL,
    [IR_ENABLED]                  VARCHAR (8)   NULL,
    [JE_VOU_APP]                  VARCHAR (10)  NULL,
    [LOGO_PATHNAME]               VARCHAR (8)   NULL,
    [MULTI_CURR]                  VARCHAR (8)   NULL,
    [NOTUSED]                     VARCHAR (9)   NULL,
    [PL_CLOSING_ACCT]             VARCHAR (9)   NULL,
    [PL_CLOSING_COST_CENTER_FLAG] VARCHAR (11)  NULL,
    [PL_VOU_APP]                  VARCHAR (11)  NULL,
    [PL_VOU_SRC]                  VARCHAR (7)   NULL,
    [REAL_CURR_EXCH_ACCT]         VARCHAR (17)  NULL,
    [RELAXED_DATA_ENTRY]          VARCHAR (7)   NULL,
    [REVERSING_JE_VOU_APP]        VARCHAR (8)   NULL,
    [REVERSING_JE_VOU_SRC]        VARCHAR (3)   NULL,
    [SUMMARY_VOU_APP]             VARCHAR (10)  NULL,
    [SUMMARY_VOU_SRC]             VARCHAR (7)   NULL,
    [UNREAL_CURR_EXCH_ACCT]       VARCHAR (19)  NULL,
    [WIP_RECLASS_REQUIRED]        VARCHAR (8)   NULL,
    [WIP_RECLASS_VOU_SRC]         VARCHAR (9)   NULL,
    [time_stamp]                  DATETIME      NULL,
    [u2_checksum]                 VARCHAR (25)  NULL
);

