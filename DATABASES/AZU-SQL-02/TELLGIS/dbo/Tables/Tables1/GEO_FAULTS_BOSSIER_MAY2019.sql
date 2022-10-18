CREATE TABLE [dbo].[GEO_FAULTS_BOSSIER_MAY2019] (
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
    CONSTRAINT [R422_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g385_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S385_idx]
    ON [dbo].[GEO_FAULTS_BOSSIER_MAY2019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363065.2584502, XMIN = -10544432.892702, YMAX = 3822599.35642479, YMIN = 3675050.3978079),
            CELLS_PER_OBJECT = 16
          );

