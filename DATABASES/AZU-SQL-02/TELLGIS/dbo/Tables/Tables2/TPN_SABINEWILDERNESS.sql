CREATE TABLE [dbo].[TPN_SABINEWILDERNESS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [NAME]              NVARCHAR (30)    NULL,
    [UnitName]          NVARCHAR (50)    NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R249_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g230_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S230_idx]
    ON [dbo].[TPN_SABINEWILDERNESS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10427446.8999303, XMIN = -10441792.6661619, YMAX = 3681040.63102429, YMIN = 3671541.18738445),
            CELLS_PER_OBJECT = 16
          );

