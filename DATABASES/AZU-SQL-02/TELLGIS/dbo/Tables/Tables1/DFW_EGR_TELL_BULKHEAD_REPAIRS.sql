CREATE TABLE [dbo].[DFW_EGR_TELL_BULKHEAD_REPAIRS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R726_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g689_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S689_idx]
    ON [dbo].[DFW_EGR_TELL_BULKHEAD_REPAIRS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389569.48222, XMIN = -10389673.8531482, YMAX = 3517282.70386715, YMIN = 3517099.20791563)
          );

