CREATE TABLE [dbo].[TPN_GROGANTOCENTERPOINT_CDP] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [AltMode]           SMALLINT         NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [Snippet]           NVARCHAR (MAX)   NULL,
    [PopupInfo]         NVARCHAR (MAX)   NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R228_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g209_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S209_idx]
    ON [dbo].[TPN_GROGANTOCENTERPOINT_CDP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10402185.9724563, XMIN = -10402186.3885437, YMAX = 3765857.12046974, YMIN = 3765856.96983546),
            CELLS_PER_OBJECT = 16
          );

