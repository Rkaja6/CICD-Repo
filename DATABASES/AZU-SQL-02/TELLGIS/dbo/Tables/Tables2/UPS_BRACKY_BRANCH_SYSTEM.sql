CREATE TABLE [dbo].[UPS_BRACKY_BRANCH_SYSTEM] (
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
    CONSTRAINT [R627_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g590_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S590_idx]
    ON [dbo].[UPS_BRACKY_BRANCH_SYSTEM] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10382041.2364131, XMIN = -10383849.3889186, YMAX = 3782797.78229163, YMIN = 3782688.13095108),
            CELLS_PER_OBJECT = 16
          );

