CREATE TABLE [dbo].[BMP_WORLDROADS] (
    [OBJECTID]          INT              NOT NULL,
    [ISO_CC]            NVARCHAR (4)     NULL,
    [Name1]             NVARCHAR (254)   NULL,
    [Name2]             NVARCHAR (254)   NULL,
    [Name3]             NVARCHAR (254)   NULL,
    [Name4]             NVARCHAR (254)   NULL,
    [Name5]             NVARCHAR (254)   NULL,
    [Shield]            NVARCHAR (50)    NULL,
    [TYPE]              NVARCHAR (20)    NULL,
    [RANK]              SMALLINT         NULL,
    [RD_FEATURE]        NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R200_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g181_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S181_idx]
    ON [dbo].[BMP_WORLDROADS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19878030.1801, XMIN = -18537870.7111, YMAX = 11227501.0126, YMIN = -7357647.4642),
            CELLS_PER_OBJECT = 16
          );

