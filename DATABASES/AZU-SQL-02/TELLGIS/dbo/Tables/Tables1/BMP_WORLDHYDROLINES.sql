CREATE TABLE [dbo].[BMP_WORLDHYDROLINES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (20)    NULL,
    [ISO_CC]            NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R193_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g174_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S174_idx]
    ON [dbo].[BMP_WORLDHYDROLINES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 16797993.8545, YMIN = -7361474.105),
            CELLS_PER_OBJECT = 16
          );

