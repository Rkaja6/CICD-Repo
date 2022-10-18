CREATE TABLE [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_POINTS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [PopupInfo]         NVARCHAR (MAX)   NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R721_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g684_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S684_idx]
    ON [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_POINTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10384017.557202, XMIN = -10407167.6088238, YMAX = 3523343.63768417, YMIN = 3509343.76943178)
          );

