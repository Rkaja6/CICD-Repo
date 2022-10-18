CREATE TABLE [dbo].[LNG_PARCELS] (
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
    CONSTRAINT [R454_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g417_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S417_idx]
    ON [dbo].[LNG_PARCELS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388998.3031211, XMIN = -10392937.4415036, YMAX = 3517828.38926259, YMIN = 3513558.33457751),
            CELLS_PER_OBJECT = 16
          );

