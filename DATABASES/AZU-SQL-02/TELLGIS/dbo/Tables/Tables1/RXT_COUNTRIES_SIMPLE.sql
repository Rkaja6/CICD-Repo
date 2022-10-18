CREATE TABLE [dbo].[RXT_COUNTRIES_SIMPLE] (
    [OBJECTID]          INT              NOT NULL,
    [COUNTRY]           NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    [InPoly_FID]        INT              NULL,
    [SimPgnFlag]        SMALLINT         NULL,
    [MaxSimpTol]        NUMERIC (38, 8)  NULL,
    [MinSimpTol]        NUMERIC (38, 8)  NULL,
    CONSTRAINT [R259_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g240_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S240_idx]
    ON [dbo].[RXT_COUNTRIES_SIMPLE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -5859444.52807925, XMIN = -19839875.4928496, YMAX = 17923775.6474476, YMIN = 1635334.65416354),
            CELLS_PER_OBJECT = 16
          );

