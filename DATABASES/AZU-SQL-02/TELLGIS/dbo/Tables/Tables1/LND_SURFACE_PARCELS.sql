CREATE TABLE [dbo].[LND_SURFACE_PARCELS] (
    [OBJECTID]          INT              NOT NULL,
    [Owner]             NVARCHAR (100)   NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [CAD_File_Name]     NVARCHAR (50)    NULL,
    [Tract]             NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R655_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g618_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S618_idx]
    ON [dbo].[LND_SURFACE_PARCELS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10397942.4614784, XMIN = -10468799.2600193, YMAX = 3789986.69448999, YMIN = 3724157.10557899),
            CELLS_PER_OBJECT = 16
          );

