CREATE TABLE [dbo].[UPS_SOUTH_GROGAN_SYSTEM] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Dia]               INT              NULL,
    [LENGTH_GEO]        NUMERIC (38, 8)  NULL,
    [Modified]          NVARCHAR (50)    NULL,
    [Agreement_]        NVARCHAR (50)    NULL,
    [CAD_NO]            NVARCHAR (50)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R629_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g592_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S592_idx]
    ON [dbo].[UPS_SOUTH_GROGAN_SYSTEM] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10398613.4259727, XMIN = -10399892.4077018, YMAX = 3746945.07765305, YMIN = 3743485.39970841),
            CELLS_PER_OBJECT = 16
          );

