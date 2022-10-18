CREATE TABLE [dbo].[RXT_NG_PRICING] (
    [OBJECTID]          INT              NOT NULL,
    [POINT_NAME]        NVARCHAR (100)   NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R163_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g144_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S144_idx]
    ON [dbo].[RXT_NG_PRICING] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7920851.8939, XMIN = -13626120.4487, YMAX = 6568302.1004, YMIN = 3115272.9537),
            CELLS_PER_OBJECT = 16
          );

