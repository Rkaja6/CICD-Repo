CREATE TABLE [dbo].[DFW_LCI_WATER_TEST] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R682_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g645_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S645_idx]
    ON [dbo].[DFW_LCI_WATER_TEST] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10390823.7172244, XMIN = -10391880.6680525, YMAX = 3517223.85143995, YMIN = 3516857.23412461)
          );

