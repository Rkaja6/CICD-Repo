CREATE TABLE [dbo].[DFW_EGR_SITE_PLAN_CONFIDENTIAL] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R716_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g679_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S679_idx]
    ON [dbo].[DFW_EGR_SITE_PLAN_CONFIDENTIAL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388642.8195942, XMIN = -10391747.1630795, YMAX = 3517008.98845249, YMIN = 3514245.76568988)
          );

