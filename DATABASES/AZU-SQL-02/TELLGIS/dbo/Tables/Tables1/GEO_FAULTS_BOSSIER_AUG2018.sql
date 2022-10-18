CREATE TABLE [dbo].[GEO_FAULTS_BOSSIER_AUG2018] (
    [OBJECTID]          INT              NOT NULL,
    [Shape_Type]        NVARCHAR (254)   NULL,
    [Line_Style]        INT              NULL,
    [Object_Id]         INT              NULL,
    [Line_Width]        INT              NULL,
    [Color_Inde]        INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R423_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g386_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S386_idx]
    ON [dbo].[GEO_FAULTS_BOSSIER_AUG2018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363065.9865715, XMIN = -10544433.6629459, YMAX = 3822600.12336768, YMIN = 3675051.12153735),
            CELLS_PER_OBJECT = 16
          );

