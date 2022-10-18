CREATE TABLE [dbo].[BMP_WORLDGAZ] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (42)    NULL,
    [CATEGORY]          NVARCHAR (16)    NULL,
    [DESCRIPT]          NVARCHAR (38)    NULL,
    [WITHIN]            NVARCHAR (40)    NULL,
    [FIPS_CNTRY]        NVARCHAR (2)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R191_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g172_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S172_idx]
    ON [dbo].[BMP_WORLDGAZ] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037173.3379435, XMIN = -20036284.2291257, YMAX = 20251201.653224, YMIN = -23035703.2248141),
            CELLS_PER_OBJECT = 16
          );

