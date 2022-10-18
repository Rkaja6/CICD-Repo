CREATE TABLE [dbo].[RXT_SHALE_PLAYS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R215_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g196_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S196_idx]
    ON [dbo].[RXT_SHALE_PLAYS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8225785.3525, XMIN = -13796443.5899, YMAX = 8400449.7881, YMIN = 3205540.6902),
            CELLS_PER_OBJECT = 16
          );

