CREATE TABLE [dbo].[DDA_RATE] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]           DATETIME        NULL,
    [ACCUM_IDC_BEG_QTR]      NUMERIC (19, 2) NULL,
    [ACCUM_LHC_BEG_QTR]      NUMERIC (19, 2) NULL,
    [ACCUM_TAN_BEG_QTR]      NUMERIC (19, 2) NULL,
    [ADJ_OVERRIDE]           VARCHAR (12)    NULL,
    [COMPANY]                VARCHAR (3)     NULL,
    [COST_CENTER]            VARCHAR (6)     NULL,
    [EOY_EQUIP_RESERVES]     NUMERIC (19, 2) NULL,
    [EOY_IDC_RESERVES]       NUMERIC (19, 2) NULL,
    [EOY_LH_RESERVES]        NUMERIC (19, 2) NULL,
    [EOY_PROD]               NUMERIC (19, 2) NULL,
    [EOY_REVISED_EQUIP_RATE] NUMERIC (19, 6) NULL,
    [EOY_REVISED_IDC_RATE]   NUMERIC (19, 6) NULL,
    [EOY_REVISED_LH_RATE]    NUMERIC (19, 6) NULL,
    [EQUIP_RATE]             NUMERIC (19, 6) NULL,
    [EQUIP_RESERVES]         NUMERIC (19, 2) NULL,
    [GROSS_IDC_COST]         NUMERIC (19, 2) NULL,
    [GROSS_LHC_COST]         NUMERIC (19, 2) NULL,
    [GROSS_TAN_COST]         NUMERIC (19, 2) NULL,
    [IDC_RATE]               NUMERIC (19, 6) NULL,
    [IDC_RESERVES]           NUMERIC (19, 2) NULL,
    [LH_RATE]                NUMERIC (19, 6) NULL,
    [LH_RESERVES]            NUMERIC (19, 2) NULL,
    [MTH_IDC_EXP]            NUMERIC (19, 2) NULL,
    [MTH_LHC_EXP]            NUMERIC (19, 2) NULL,
    [MTH_SALES_BOE]          NUMERIC (19, 2) NULL,
    [MTH_TAN_EXP]            NUMERIC (19, 2) NULL,
    [PROD]                   NUMERIC (19, 2) NULL,
    [QTR_IDC_EXP]            NUMERIC (19, 2) NULL,
    [QTR_LHC_EXP]            NUMERIC (19, 2) NULL,
    [QTR_TAN_EXP]            NUMERIC (19, 2) NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

