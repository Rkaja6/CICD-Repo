CREATE TABLE [dbo].[TPN_PROPOSEDWOODFORD] (
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
    CONSTRAINT [R245_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g226_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S226_idx]
    ON [dbo].[TPN_PROPOSEDWOODFORD] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10359102.4608036, XMIN = -10924592.3452353, YMAX = 4263907.62702642, YMIN = 3552616.40464871),
            CELLS_PER_OBJECT = 16
          );

