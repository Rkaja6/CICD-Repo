CREATE TABLE [dbo].[DFW_EGR_LNG_CONSTRUCTIONLIMITS] (
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
    CONSTRAINT [R758_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g721_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S721_idx]
    ON [dbo].[DFW_EGR_LNG_CONSTRUCTIONLIMITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388997.211761, XMIN = -10391356.9378365, YMAX = 3516917.96604991, YMIN = 3514157.82770406)
          );

