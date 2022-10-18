CREATE TABLE [dbo].[DFW_EGR_SITE_PLAN_PUBLIC] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R715_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g678_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S678_idx]
    ON [dbo].[DFW_EGR_SITE_PLAN_PUBLIC] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388565.1174764, XMIN = -10391754.3883824, YMAX = 3517002.84800731, YMIN = 3514266.67098176)
          );

