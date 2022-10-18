CREATE TABLE [dbo].[WEL_DIRECTIONALWELLPATH] (
    [OBJECTID]          INT              NOT NULL,
    [UWI]               NVARCHAR (254)   NULL,
    [Survey_Typ]        NVARCHAR (254)   NULL,
    [North_Refe]        NVARCHAR (254)   NULL,
    [Borehole_I]        INT              NULL,
    [Computatio]        NVARCHAR (254)   NULL,
    [Well_Numbe]        NVARCHAR (254)   NULL,
    [Primary_Ty]        NVARCHAR (254)   NULL,
    [Well_Name]         NVARCHAR (254)   NULL,
    [Name]              NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R405_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g368_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S368_idx]
    ON [dbo].[WEL_DIRECTIONALWELLPATH] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10399599.6897196, XMIN = -10399732.7686179, YMAX = 3763908.03886703, YMIN = 3762034.45353788),
            CELLS_PER_OBJECT = 16
          );

