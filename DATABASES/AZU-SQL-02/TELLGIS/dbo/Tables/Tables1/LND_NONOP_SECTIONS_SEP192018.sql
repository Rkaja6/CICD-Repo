CREATE TABLE [dbo].[LND_NONOP_SECTIONS_SEP192018] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [WI]                NUMERIC (38, 8)  NULL,
    [NRI]               NUMERIC (38, 8)  NULL,
    [Operator]          NVARCHAR (10)    NULL,
    [Notes]             NVARCHAR (150)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R223_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g204_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S204_idx]
    ON [dbo].[LND_NONOP_SECTIONS_SEP192018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10369557.4256, XMIN = -10468793.489, YMAX = 3821468.759, YMIN = 3723955.4822),
            CELLS_PER_OBJECT = 16
          );

