CREATE TABLE [dbo].[WEL_TELLCURATED_HAYNESVILLE_LAT] (
    [OBJECTID]          INT              NOT NULL,
    [Longitude]         NUMERIC (38, 8)  NULL,
    [Survey_Typ]        NVARCHAR (254)   NULL,
    [Hole_Direc]        NVARCHAR (254)   NULL,
    [Name]              NVARCHAR (254)   NULL,
    [UWI]               NVARCHAR (254)   NULL,
    [ZIndexOrde]        INT              NULL,
    [SurfLocY]          NUMERIC (38, 8)  NULL,
    [KB_Elevati]        NUMERIC (38, 8)  NULL,
    [Borehole_I]        INT              NULL,
    [Primary_Ty]        NVARCHAR (254)   NULL,
    [Well_Numbe]        NVARCHAR (254)   NULL,
    [Active_Ele]        NUMERIC (38, 8)  NULL,
    [Computatio]        NVARCHAR (254)   NULL,
    [Well_Name]         NVARCHAR (254)   NULL,
    [North_Refe]        NVARCHAR (254)   NULL,
    [Current_Op]        NVARCHAR (254)   NULL,
    [Lease_Name]        NVARCHAR (254)   NULL,
    [Borehole_N]        NVARCHAR (254)   NULL,
    [Latitude]          NUMERIC (38, 8)  NULL,
    [SurfLocX]          NUMERIC (38, 8)  NULL,
    [Total_Dept]        NUMERIC (38, 8)  NULL,
    [Join_]             NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R570_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g533_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S533_idx]
    ON [dbo].[WEL_TELLCURATED_HAYNESVILLE_LAT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10357821.1647806, XMIN = -10708689.9428124, YMAX = 3896331.49314842, YMIN = 3657108.84143925),
            CELLS_PER_OBJECT = 16
          );

