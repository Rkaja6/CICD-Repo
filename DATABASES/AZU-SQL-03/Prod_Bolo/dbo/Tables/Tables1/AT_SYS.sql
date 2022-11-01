﻿CREATE TABLE [dbo].[AT_SYS] (
    [u2_id]                     VARCHAR (255) NOT NULL,
    [ALLOC_VOU_APP]             VARCHAR (10)  NULL,
    [ALLOC_VOU_SRC]             VARCHAR (5)   NULL,
    [BOOK_DEPLETION_FLAG]       VARCHAR (4)   NULL,
    [DDA_VOU_APP]               VARCHAR (10)  NULL,
    [DDA_VOU_SRC]               VARCHAR (3)   NULL,
    [EQUIP_INVENTORY_ACCT]      VARCHAR (10)  NULL,
    [INVENTORY_WRITE_OFF_ACCT]  VARCHAR (10)  NULL,
    [MT_GAIN_LOSS_ACCT]         VARCHAR (10)  NULL,
    [MT_VOU_APP]                VARCHAR (10)  NULL,
    [MT_VOU_SRC]                VARCHAR (3)   NULL,
    [NEXT_YR_TAX_RESERVES_FLAG] VARCHAR (8)   NULL,
    [PROCEEDS_CLRG_ACCT]        VARCHAR (10)  NULL,
    [RECOVER_DEPR_FLAG]         VARCHAR (10)  NULL,
    [RET_VOU_APP]               VARCHAR (10)  NULL,
    [RET_VOU_SRC]               VARCHAR (6)   NULL,
    [TAX_ADJ_CONTRA_ACCT]       VARCHAR (10)  NULL,
    [TAX_ADJ_VOU_APP]           VARCHAR (10)  NULL,
    [TAX_ADJ_VOU_SRC]           VARCHAR (4)   NULL,
    [TAX_EXC_COA_GROUP]         VARCHAR (5)   NULL,
    [UOP_DDA_EXP_RPTG_LEVEL]    VARCHAR (5)   NULL,
    [USE_BOOK_RESERVES_FOR_TAX] VARCHAR (8)   NULL,
    [WIP_ACCUM_DDA_CLRG_ACCT]   VARCHAR (12)  NULL,
    [time_stamp]                DATETIME      NULL,
    [u2_checksum]               VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);
