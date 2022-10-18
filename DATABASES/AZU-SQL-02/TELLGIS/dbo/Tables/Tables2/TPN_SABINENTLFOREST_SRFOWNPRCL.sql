CREATE TABLE [dbo].[TPN_SABINENTLFOREST_SRFOWNPRCL] (
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
    CONSTRAINT [R252_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g233_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S233_idx]
    ON [dbo].[TPN_SABINENTLFOREST_SRFOWNPRCL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7206192.30145338, XMIN = -16698808.6790741, YMAX = 8745977.64823487, YMIN = 2007019.72160653),
            CELLS_PER_OBJECT = 16
          );

