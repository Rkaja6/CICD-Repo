CREATE TABLE [dbo].[CAD_MP_FCL04_06222017_V2] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (254)   NULL,
    [MP]                NUMERIC (38, 8)  NULL,
    [MP_Text]           NVARCHAR (8)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R142_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g123_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S123_idx]
    ON [dbo].[CAD_MP_FCL04_06222017_V2] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269674.1399991, XMIN = -10397549.0194929, YMAX = 3583601.79341391, YMIN = 3516737.94011359),
            CELLS_PER_OBJECT = 16
          );

