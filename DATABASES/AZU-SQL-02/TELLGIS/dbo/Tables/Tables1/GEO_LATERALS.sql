CREATE TABLE [dbo].[GEO_LATERALS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R210_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g191_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S191_idx]
    ON [dbo].[GEO_LATERALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10376589.7684, XMIN = -10422287.8869, YMAX = 3788479.1309, YMIN = 3737413.2303),
            CELLS_PER_OBJECT = 16
          );

