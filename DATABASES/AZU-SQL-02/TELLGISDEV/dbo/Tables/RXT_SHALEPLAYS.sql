CREATE TABLE [dbo].[RXT_SHALEPLAYS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R81_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g71_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S71_idx]
    ON [dbo].[RXT_SHALEPLAYS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8225785.5046, XMIN = -13796445.6662, YMAX = 8443865.1713, YMIN = 3200968.7741),
            CELLS_PER_OBJECT = 16
          );

