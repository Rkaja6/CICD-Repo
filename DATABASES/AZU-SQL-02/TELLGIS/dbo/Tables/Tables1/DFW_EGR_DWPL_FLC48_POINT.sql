CREATE TABLE [dbo].[DFW_EGR_DWPL_FLC48_POINT] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R734_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g697_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S697_idx]
    ON [dbo].[DFW_EGR_DWPL_FLC48_POINT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269716.0248612, XMIN = -10397550.8080716, YMAX = 3583591.30454825, YMIN = 3516764.88668032)
          );

