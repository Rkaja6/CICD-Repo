CREATE TABLE [dbo].[DI_TX_PIPELINES] (
    [OBJECTID]          INT              NOT NULL,
    [FNODE_]            NUMERIC (38, 8)  NULL,
    [TNODE_]            NUMERIC (38, 8)  NULL,
    [LPOLY_]            NUMERIC (38, 8)  NULL,
    [RPOLY_]            NUMERIC (38, 8)  NULL,
    [LENGTH]            NUMERIC (38, 8)  NULL,
    [OPER_LINK]         INT              NULL,
    [OPS_ID]            INT              NULL,
    [P5_NUM]            NVARCHAR (6)     NULL,
    [P5_SPACE]          NVARCHAR (1)     NULL,
    [OPER_NM]           NVARCHAR (40)    NULL,
    [SYS_NM]            NVARCHAR (100)   NULL,
    [SUBSYS_NM]         NVARCHAR (100)   NULL,
    [PLINE_ID]          NVARCHAR (50)    NULL,
    [SYS_ID]            NVARCHAR (6)     NULL,
    [DIAMETER]          NUMERIC (38, 8)  NULL,
    [COMMODITY1]        NVARCHAR (3)     NULL,
    [COMMODITY2]        NVARCHAR (3)     NULL,
    [COMMODITY3]        NVARCHAR (3)     NULL,
    [CMDTY_DESC]        NVARCHAR (40)    NULL,
    [INTERSTATE]        NVARCHAR (1)     NULL,
    [STATUS_CD]         NVARCHAR (1)     NULL,
    [QUALITY_CD]        NVARCHAR (1)     NULL,
    [REVIS_CD]          NVARCHAR (1)     NULL,
    [META_NAME]         NVARCHAR (13)    NULL,
    [T4PERMIT]          NVARCHAR (5)     NULL,
    [SYSTYPE]           NVARCHAR (1)     NULL,
    [COUNTY]            NVARCHAR (3)     NULL,
    [MODDATE]           NVARCHAR (10)    NULL,
    [COM_CARRIE]        NVARCHAR (1)     NULL,
    [NPMS_SYS_I]        INT              NULL,
    [METADATA_I]        NVARCHAR (8)     NULL,
    [ALBERS_MIL]        NUMERIC (38, 8)  NULL,
    [SUBREPOS_C]        NVARCHAR (2)     NULL,
    [FLAG1]             NVARCHAR (1)     NULL,
    [FLAG2]             NVARCHAR (1)     NULL,
    [INITIALS]          NVARCHAR (3)     NULL,
    [TX_REG]            NVARCHAR (1)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R524_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g487_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S487_idx]
    ON [dbo].[DI_TX_PIPELINES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10411850.6139, XMIN = -11870909.2915, YMAX = 4369681.8415, YMIN = 2988551.4229),
            CELLS_PER_OBJECT = 16
          );

