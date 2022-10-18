CREATE TABLE [dbo].[DFW_LCI_FORESTATION_TRACTS] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (254)   NULL,
    [FolderPath]        NVARCHAR (254)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Owners]            NVARCHAR (150)   NULL,
    [Status]            NVARCHAR (150)   NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Plantable_Trees]   NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R679_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g642_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S642_idx]
    ON [dbo].[DFW_LCI_FORESTATION_TRACTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10390811.6429727, XMIN = -10392219.8778481, YMAX = 3517664.69272983, YMIN = 3516842.32691339)
          );

