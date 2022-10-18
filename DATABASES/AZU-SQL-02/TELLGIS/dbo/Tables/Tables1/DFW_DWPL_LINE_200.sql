CREATE TABLE [dbo].[DFW_DWPL_LINE_200] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Equation]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R633_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g596_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S596_idx]
    ON [dbo].[DFW_DWPL_LINE_200] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10368911.425277, XMIN = -10397573.4395593, YMAX = 3562966.29590203, YMIN = 3516883.34798342),
            CELLS_PER_OBJECT = 16
          );

