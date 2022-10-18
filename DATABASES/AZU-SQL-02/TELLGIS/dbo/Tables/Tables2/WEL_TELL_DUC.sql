CREATE TABLE [dbo].[WEL_TELL_DUC] (
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
    [Well_Nam_1]        NVARCHAR (254)   NULL,
    [Lease_Name]        NVARCHAR (254)   NULL,
    [Borehole_N]        NVARCHAR (254)   NULL,
    [Latitude]          NUMERIC (38, 8)  NULL,
    [SurfLocX]          NUMERIC (38, 8)  NULL,
    [Total_Dept]        NUMERIC (38, 8)  NULL,
    [MAP_LABEL]         NVARCHAR (50)    NULL,
    [TYPE]              NVARCHAR (25)    NULL,
    [SHL_LAT]           NUMERIC (38, 8)  NULL,
    [SHL_LONG]          NUMERIC (38, 8)  NULL,
    [BHL_LAT]           NUMERIC (38, 8)  NULL,
    [BHL_LONG]          NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R619_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g582_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S582_idx]
    ON [dbo].[WEL_TELL_DUC] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10390322.3255755, XMIN = -10402430.827949, YMAX = 3790628.61501904, YMIN = 3754538.10457167),
            CELLS_PER_OBJECT = 16
          );

