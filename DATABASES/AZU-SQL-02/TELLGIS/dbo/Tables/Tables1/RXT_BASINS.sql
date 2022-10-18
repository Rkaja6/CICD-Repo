CREATE TABLE [dbo].[RXT_BASINS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R344_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g307_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S307_idx]
    ON [dbo].[RXT_BASINS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -4908808.4005, XMIN = -18278263.6217, YMAX = 14165287.5125, YMIN = 1886986.1939),
            CELLS_PER_OBJECT = 16
          );

