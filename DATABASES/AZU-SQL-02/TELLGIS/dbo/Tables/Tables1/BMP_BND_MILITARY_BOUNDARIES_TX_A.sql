CREATE TABLE [dbo].[BMP_BND_MILITARY_BOUNDARIES_TX_A] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [GID]               INT              NULL,
    [MILIT_TYP]         NVARCHAR (80)    NULL,
    [MILIT_NM]          NVARCHAR (80)    NULL,
    [GRID_OP]           NVARCHAR (80)    NULL,
    [CREATE_DT]         NVARCHAR (80)    NULL,
    [CREATE_NM]         NVARCHAR (80)    NULL,
    [EDIT_DT]           NVARCHAR (80)    NULL,
    [EDIT_NM]           NVARCHAR (80)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R291_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g272_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S272_idx]
    ON [dbo].[BMP_BND_MILITARY_BOUNDARIES_TX_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10475181.4906, XMIN = -11854543.8888, YMAX = 4196554.2208, YMIN = 3007848.0931),
            CELLS_PER_OBJECT = 16
          );

