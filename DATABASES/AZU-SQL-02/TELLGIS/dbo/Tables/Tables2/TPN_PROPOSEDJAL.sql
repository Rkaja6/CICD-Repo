CREATE TABLE [dbo].[TPN_PROPOSEDJAL] (
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
    CONSTRAINT [R238_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g219_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S219_idx]
    ON [dbo].[TPN_PROPOSEDJAL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -11474288.879436, XMIN = -11559714.612869, YMAX = 3784463.91591059, YMIN = 3668765.35586935),
            CELLS_PER_OBJECT = 16
          );

