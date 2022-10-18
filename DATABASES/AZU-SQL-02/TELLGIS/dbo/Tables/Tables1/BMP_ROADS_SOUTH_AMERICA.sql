CREATE TABLE [dbo].[BMP_ROADS_SOUTH_AMERICA] (
    [OBJECTID]          INT              NOT NULL,
    [FNODE_]            INT              NULL,
    [TNODE_]            INT              NULL,
    [LPOLY_]            INT              NULL,
    [RPOLY_]            INT              NULL,
    [LENGTH]            NUMERIC (38, 8)  NULL,
    [RDLINE0_]          INT              NULL,
    [RDLINE0_ID]        INT              NULL,
    [RDLNTYPE]          SMALLINT         NULL,
    [RDLNSTAT]          SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R706_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g669_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S669_idx]
    ON [dbo].[BMP_ROADS_SOUTH_AMERICA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -3877266.98581509, XMIN = -10135100.6707481, YMAX = 1397045.70979091, YMIN = -7340163.99237868)
          );

