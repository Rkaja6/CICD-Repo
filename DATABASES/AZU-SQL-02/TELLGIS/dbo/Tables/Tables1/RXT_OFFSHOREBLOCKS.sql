CREATE TABLE [dbo].[RXT_OFFSHOREBLOCKS] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [BLOCKS_]           INT              NULL,
    [BLOCKS_ID]         INT              NULL,
    [MMS_REGION]        NVARCHAR (1)     NULL,
    [MMS_PLAN_A]        NVARCHAR (3)     NULL,
    [PROT_NUMBE]        NVARCHAR (7)     NULL,
    [PROT_APRV_]        NVARCHAR (11)    NULL,
    [BLOCK_NUMB]        NVARCHAR (6)     NULL,
    [BLK_FED_AP]        NVARCHAR (11)    NULL,
    [BLOCK_LAB]         NVARCHAR (6)     NULL,
    [AC_LAB]            NVARCHAR (8)     NULL,
    [AREA_CODE]         NVARCHAR (2)     NULL,
    [STATE_NAME]        NVARCHAR (30)    NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R381_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g344_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S344_idx]
    ON [dbo].[RXT_OFFSHOREBLOCKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9035815.1323, XMIN = -10824595.5944, YMAX = 3540765.585, YMIN = 2726717.7395),
            CELLS_PER_OBJECT = 16
          );

