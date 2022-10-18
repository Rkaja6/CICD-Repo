CREATE TABLE [dbo].[TPN_PROPOSEDHGAP] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [AltMode]           SMALLINT         NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [Clamped]           SMALLINT         NULL,
    [Extruded]          SMALLINT         NULL,
    [Snippet]           NVARCHAR (MAX)   NULL,
    [PopupInfo]         NVARCHAR (MAX)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R241_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g222_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S222_idx]
    ON [dbo].[TPN_PROPOSEDHGAP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10339223.1865491, XMIN = -10413361.0262111, YMAX = 3872403.56325492, YMIN = 3552712.43396582),
            CELLS_PER_OBJECT = 16
          );

