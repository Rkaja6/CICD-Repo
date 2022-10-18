CREATE TABLE [dbo].[GEO_WELLS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [Unit]              NVARCHAR (50)    NULL,
    [Well_Name]         NVARCHAR (50)    NULL,
    [Well_Type]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R209_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g190_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S190_idx]
    ON [dbo].[GEO_WELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10376590.5008, XMIN = -10422288.6297, YMAX = 3786930.5331, YMIN = 3739179.3235),
            CELLS_PER_OBJECT = 16
          );

