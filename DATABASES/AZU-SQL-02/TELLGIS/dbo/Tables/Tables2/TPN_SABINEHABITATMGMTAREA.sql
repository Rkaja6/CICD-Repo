CREATE TABLE [dbo].[TPN_SABINEHABITATMGMTAREA] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [HMA_]              INT              NULL,
    [HMA_ID]            INT              NULL,
    [HMA]               NVARCHAR (2)     NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R247_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g228_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S228_idx]
    ON [dbo].[TPN_SABINEHABITATMGMTAREA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10430377.7491359, XMIN = -10468217.0038938, YMAX = 3733571.8250403, YMIN = 3651754.93100867),
            CELLS_PER_OBJECT = 16
          );

