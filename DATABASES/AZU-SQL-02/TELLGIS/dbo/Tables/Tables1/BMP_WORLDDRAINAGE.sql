CREATE TABLE [dbo].[BMP_WORLDDRAINAGE] (
    [OBJECTID]          INT              NOT NULL,
    [SYSTEM]            NVARCHAR (40)    NULL,
    [BASIN_AREA]        INT              NULL,
    [DISCHARGE]         NUMERIC (38, 8)  NULL,
    [SED_LOAD]          INT              NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [KILOMETERS]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R190_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g171_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S171_idx]
    ON [dbo].[BMP_WORLDDRAINAGE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 15125491.0712, XMIN = -14967861.8728, YMAX = 11537828.2865, YMIN = -4035593.5095),
            CELLS_PER_OBJECT = 16
          );

