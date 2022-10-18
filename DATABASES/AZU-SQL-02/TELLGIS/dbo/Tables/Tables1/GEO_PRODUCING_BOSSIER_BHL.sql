CREATE TABLE [dbo].[GEO_PRODUCING_BOSSIER_BHL] (
    [OBJECTID]          INT              NOT NULL,
    [UWI]               NVARCHAR (20)    NULL,
    [LL_POS]            NVARCHAR (12)    NULL,
    [WELL_NUM]          NVARCHAR (20)    NULL,
    [LEASE]             NVARCHAR (60)    NULL,
    [TD]                NVARCHAR (20)    NULL,
    [TD_FM]             NVARCHAR (20)    NULL,
    [PROJ_TD]           NVARCHAR (20)    NULL,
    [PROJ_FM]           NVARCHAR (20)    NULL,
    [FINAL_STAT]        NVARCHAR (12)    NULL,
    [OPERATOR]          NVARCHAR (60)    NULL,
    [FIELD]             NVARCHAR (30)    NULL,
    [PERM_DATE]         DATETIME2 (7)    NULL,
    [SPUD_DATE]         DATETIME2 (7)    NULL,
    [COMP_DATE]         DATETIME2 (7)    NULL,
    [PLOT_SYM]          NVARCHAR (2)     NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R41_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g31_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S31_idx]
    ON [dbo].[GEO_PRODUCING_BOSSIER_BHL] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

