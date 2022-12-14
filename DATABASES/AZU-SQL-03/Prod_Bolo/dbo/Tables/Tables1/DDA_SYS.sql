CREATE TABLE [dbo].[DDA_SYS] (
    [u2_id]                       VARCHAR (255) NOT NULL,
    [CALC_RPT_LEVEL]              VARCHAR (6)   NULL,
    [DDA_SYS_VOU_APP]             VARCHAR (20)  NULL,
    [DDA_VOU_SRC]                 VARCHAR (20)  NULL,
    [EQUIP_ACCUM_DEPR_ACCT]       VARCHAR (10)  NULL,
    [EQUIP_DEPR_BASIS_ACCT_GROUP] VARCHAR (20)  NULL,
    [EQUIP_DEPR_EXP_ACCT]         VARCHAR (10)  NULL,
    [EXP_RPT_LEVEL]               VARCHAR (6)   NULL,
    [GAS_PROD_ACCT_GROUP]         VARCHAR (10)  NULL,
    [GAS_RESERVES_ACCT]           VARCHAR (10)  NULL,
    [IDC_ACCUM_DEPL_ACCT]         VARCHAR (10)  NULL,
    [IDC_DEPL_BASIS_ACCT_GROUP]   VARCHAR (20)  NULL,
    [IDC_DEPL_EXP_ACCT]           VARCHAR (10)  NULL,
    [LH_ACCUM_DEPL_ACCT]          VARCHAR (10)  NULL,
    [LH_DEPL_BASIS_ACCT_GROUP]    VARCHAR (20)  NULL,
    [LH_DEPL_EXP_ACCT]            VARCHAR (10)  NULL,
    [NGL_PROD_ACCT_GROUP]         VARCHAR (10)  NULL,
    [NGL_RESERVES_ACCT]           VARCHAR (10)  NULL,
    [OIL_PROD_ACCT_GROUP]         VARCHAR (10)  NULL,
    [OIL_RESERVES_ACCT]           VARCHAR (10)  NULL,
    [RPT_HIERARCHY]               VARCHAR (9)   NULL,
    [time_stamp]                  DATETIME      NULL,
    [u2_checksum]                 VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

