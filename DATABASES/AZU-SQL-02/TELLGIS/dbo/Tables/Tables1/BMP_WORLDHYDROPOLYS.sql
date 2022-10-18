CREATE TABLE [dbo].[BMP_WORLDHYDROPOLYS] (
    [OBJECTID]          INT              NOT NULL,
    [Name1]             NVARCHAR (254)   NULL,
    [Name2]             NVARCHAR (254)   NULL,
    [Name3]             NVARCHAR (254)   NULL,
    [TYPE]              NVARCHAR (20)    NULL,
    [ISO_CC]            NVARCHAR (2)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R194_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g175_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S175_idx]
    ON [dbo].[BMP_WORLDHYDROPOLYS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 30240971.9584, YMIN = -20733939.0357),
            CELLS_PER_OBJECT = 16
          );

