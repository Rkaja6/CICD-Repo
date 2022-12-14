CREATE TABLE [dbo].[WETLANDS_LA_GTHALFACRE] (
    [OBJECTID]          INT              NOT NULL,
    [ATTRIBUTE]         NVARCHAR (15)    NULL,
    [WETLAND_TYPE]      NVARCHAR (50)    NULL,
    [ACRES]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R104_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g94_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S94_idx]
    ON [dbo].[WETLANDS_LA_GTHALFACRE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

