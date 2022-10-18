CREATE TABLE [dbo].[TPC_GATHERINGSYSTEM] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Dia]               INT              NULL,
    [LENGTH_GEO]        NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R233_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g214_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S214_idx]
    ON [dbo].[TPC_GATHERINGSYSTEM] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10381891.1066782, XMIN = -10407543.6959188, YMAX = 3789635.08335654, YMIN = 3743522.7750952),
            CELLS_PER_OBJECT = 16
          );

