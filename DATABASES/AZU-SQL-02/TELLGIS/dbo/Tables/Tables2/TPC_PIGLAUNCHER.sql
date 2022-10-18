CREATE TABLE [dbo].[TPC_PIGLAUNCHER] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R229_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g210_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S210_idx]
    ON [dbo].[TPC_PIGLAUNCHER] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10382047.9521582, XMIN = -10392302.752041, YMAX = 3786518.71182539, YMIN = 3782743.17998761),
            CELLS_PER_OBJECT = 16
          );

