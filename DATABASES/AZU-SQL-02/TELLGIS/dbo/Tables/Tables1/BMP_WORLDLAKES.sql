CREATE TABLE [dbo].[BMP_WORLDLAKES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (40)    NULL,
    [SURF_ELEV]         INT              NULL,
    [DEPTH]             INT              NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [SQKM]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R195_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g176_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S176_idx]
    ON [dbo].[BMP_WORLDLAKES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 12241247.8051, XMIN = -13928664.0664, YMAX = 10169443.8462, YMIN = -1875039.5351),
            CELLS_PER_OBJECT = 16
          );

