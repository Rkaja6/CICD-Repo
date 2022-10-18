CREATE TABLE [dbo].[TPN_SABINEHERITAGEMGMTAREA] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [AREA_]             NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [COMP_]             INT              NULL,
    [GISACRES]          INT              NULL,
    [INSIDE]            NVARCHAR (3)     NULL,
    [UnitName]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R248_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g229_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S229_idx]
    ON [dbo].[TPN_SABINEHERITAGEMGMTAREA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10430378.4771302, XMIN = -10468217.7451352, YMAX = 3733572.56608315, YMIN = 3651755.65039878),
            CELLS_PER_OBJECT = 16
          );

