CREATE TABLE [dbo].[GATH_SYS] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [ANALYST]               VARCHAR (8)   NULL,
    [AV_BEGIN_DATE]         DATETIME      NULL,
    [CALC_GAIN_LOSS_FLAG]   VARCHAR (6)   NULL,
    [COMPANY]               VARCHAR (3)   NULL,
    [DESCRIPTION]           VARCHAR (42)  NULL,
    [DFLT_PRODUCT]          VARCHAR (7)   NULL,
    [EFF_DATE]              DATETIME      NULL,
    [EXP_DATE]              DATETIME      NULL,
    [GAS_BAL_ONLY_FLAG]     VARCHAR (4)   NULL,
    [INACTIVE_DATE]         DATETIME      NULL,
    [MANUAL_ENTRY_FLAG]     VARCHAR (6)   NULL,
    [NRI_BASED]             VARCHAR (5)   NULL,
    [PROCESS_STARTING_TIME] VARCHAR (8)   NULL,
    [SYS_REF]               VARCHAR (14)  NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

