CREATE TABLE [dbo].[RXT_ROADS] (
    [OBJECTID]          INT              NOT NULL,
    [STREETNAME]        NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (15)    NULL,
    [TYPE_DET]          NVARCHAR (150)   NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R468_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g431_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S431_idx]
    ON [dbo].[RXT_ROADS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19976612.6697, XMIN = -19698977.4076, YMAX = 13576887.0027, YMIN = -1616301.4922),
            CELLS_PER_OBJECT = 16
          );

