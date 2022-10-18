CREATE TABLE [dbo].[BMP_WORLDWWF_TERR] (
    [OBJECTID]          INT              NOT NULL,
    [ECO_NAME]          NVARCHAR (65)    NULL,
    [REALM]             NVARCHAR (12)    NULL,
    [BIOME]             INT              NULL,
    [BIOME_DESC]        NVARCHAR (60)    NULL,
    [ECO_NUM]           INT              NULL,
    [STATUS]            NVARCHAR (28)    NULL,
    [PRIORITY]          NVARCHAR (3)     NULL,
    [G200_NUM]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R204_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g185_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S185_idx]
    ON [dbo].[BMP_WORLDWWF_TERR] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037506.6061, XMIN = -20037507.0672, YMAX = 18417906.6964, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

