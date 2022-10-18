CREATE TABLE [dbo].[GEO_TC_AREAS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R261_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g242_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S242_idx]
    ON [dbo].[GEO_TC_AREAS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10402189.3175, XMIN = -10470660.7444, YMAX = 3830281.877, YMIN = 3730211.2965),
            CELLS_PER_OBJECT = 16
          );

