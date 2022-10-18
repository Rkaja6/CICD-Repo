CREATE TABLE [dbo].[GEO_FAULTS_HAYNESVILLE_AUG2018] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Shape_Type]        NVARCHAR (254)   NULL,
    [Line_Style]        INT              NULL,
    [Object_Id]         INT              NULL,
    [Line_Width]        INT              NULL,
    [Color_Inde]        INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R221_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g202_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S202_idx]
    ON [dbo].[GEO_FAULTS_HAYNESVILLE_AUG2018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10362933.2319711, XMIN = -10545034.155334, YMAX = 3822439.25119078, YMIN = 3674290.31834053),
            CELLS_PER_OBJECT = 16
          );

