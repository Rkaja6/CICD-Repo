CREATE TABLE [dbo].[BMP_WORLDRAILROADS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME1]             NVARCHAR (50)    NULL,
    [NAME2]             NVARCHAR (50)    NULL,
    [NAME3]             NVARCHAR (50)    NULL,
    [ISO_CC]            NVARCHAR (2)     NULL,
    [RR_FEATURE]        NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R198_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g179_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S179_idx]
    ON [dbo].[BMP_WORLDRAILROADS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19816411.1465, XMIN = -14511541.5674, YMAX = 10582655.6997, YMIN = -5847174.5657),
            CELLS_PER_OBJECT = 16
          );

