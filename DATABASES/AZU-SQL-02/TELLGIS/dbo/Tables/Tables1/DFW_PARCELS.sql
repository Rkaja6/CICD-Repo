CREATE TABLE [dbo].[DFW_PARCELS] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (254)   NULL,
    [FolderPath]        NVARCHAR (254)   NULL,
    [SymbolID]          INT              NULL,
    [AltMode]           INT              NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [Clamped]           INT              NULL,
    [Extruded]          INT              NULL,
    [Snippet]           NVARCHAR (254)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Owners]            NVARCHAR (150)   NULL,
    [Status]            NVARCHAR (150)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R635_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g598_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S598_idx]
    ON [dbo].[DFW_PARCELS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388995.2732967, XMIN = -10393422.8034966, YMAX = 3518864.41454278, YMIN = 3513256.08919429),
            CELLS_PER_OBJECT = 16
          );

