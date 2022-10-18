CREATE TABLE [dbo].[UPS_TELL_OP_PDP] (
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
    [Formation]         NVARCHAR (50)    NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R770_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g733_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S733_idx]
    ON [dbo].[UPS_TELL_OP_PDP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10382680.7716483, XMIN = -10403837.3875729, YMAX = 3811632.10578663, YMIN = 3743069.49082847)
          );

