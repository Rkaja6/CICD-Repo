CREATE TABLE [dbo].[RXT_CRD_PRD_REFINE] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [CAP_BCD]           INT              NULL,
    [CAP_OP_BCD]        INT              NULL,
    [DCC_VD]            NUMERIC (38, 8)  NULL,
    [DCC_TC_DC]         NUMERIC (38, 8)  NULL,
    [DCC_CC_F]          NUMERIC (38, 8)  NULL,
    [DCC_CC_R]          NUMERIC (38, 8)  NULL,
    [DCC_CH_D]          NUMERIC (38, 8)  NULL,
    [DCC_CH_GO]         NUMERIC (38, 8)  NULL,
    [DCC_CR_LP]         NUMERIC (38, 8)  NULL,
    [DCC_CR_HP]         NUMERIC (38, 8)  NULL,
    [DCC_D_FSD]         NUMERIC (38, 8)  NULL,
    [DCC_D_NRF]         NUMERIC (38, 8)  NULL,
    [DCC_D_G]           NUMERIC (38, 8)  NULL,
    [DCC_D_KJT]         NUMERIC (38, 8)  NULL,
    [DCC_D_DF]          NUMERIC (38, 8)  NULL,
    [DCC_D_OD]          NUMERIC (38, 8)  NULL,
    [DCC_D_HGO]         NUMERIC (38, 8)  NULL,
    [DCC_D_O]           NUMERIC (38, 8)  NULL,
    [PC_AL]             NUMERIC (38, 8)  NULL,
    [PC_AR]             NUMERIC (38, 8)  NULL,
    [PC_ARD]            NUMERIC (38, 8)  NULL,
    [PC_I_IB]           NUMERIC (38, 8)  NULL,
    [PC_I_IP_IH]        NUMERIC (38, 8)  NULL,
    [PC_L]              NUMERIC (38, 8)  NULL,
    [PC_MPC]            NUMERIC (38, 8)  NULL,
    [PC_H_MMCFD]        NUMERIC (38, 8)  NULL,
    [PC_S_STPD]         NUMERIC (38, 8)  NULL,
    [COMPLEXITY]        NUMERIC (38, 8)  NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R149_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g130_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S130_idx]
    ON [dbo].[RXT_CRD_PRD_REFINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6010513.3414, XMIN = -17600758.0852, YMAX = 11175477.7925, YMIN = 1830034.1685),
            CELLS_PER_OBJECT = 16
          );

