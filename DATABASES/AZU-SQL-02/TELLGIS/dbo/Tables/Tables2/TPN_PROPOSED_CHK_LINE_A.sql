CREATE TABLE [dbo].[TPN_PROPOSED_CHK_LINE_A] (
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
    CONSTRAINT [R243_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g224_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S224_idx]
    ON [dbo].[TPN_PROPOSED_CHK_LINE_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10359102.4608036, XMIN = -10494970.232462, YMAX = 3787773.93678235, YMIN = 3552616.40464871),
            CELLS_PER_OBJECT = 16
          );

