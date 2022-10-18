CREATE TABLE [dbo].[TPN_SABINEWILDLIFEMGMTAREA] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Perimeter]         NUMERIC (38, 8)  NULL,
    [AREA_]             NUMERIC (38, 8)  NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Hectares]          NUMERIC (38, 8)  NULL,
    [UnitName]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R250_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g231_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S231_idx]
    ON [dbo].[TPN_SABINEWILDLIFEMGMTAREA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10444607.0066019, XMIN = -10461495.963961, YMAX = 3671924.70543365, YMIN = 3652381.9137039),
            CELLS_PER_OBJECT = 16
          );

