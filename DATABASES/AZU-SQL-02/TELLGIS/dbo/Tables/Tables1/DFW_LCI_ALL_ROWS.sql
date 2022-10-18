CREATE TABLE [dbo].[DFW_LCI_ALL_ROWS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R685_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g648_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S648_idx]
    ON [dbo].[DFW_LCI_ALL_ROWS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10390812.4162943, XMIN = -10391515.9403845, YMAX = 3517137.54034181, YMIN = 3516843.57709051)
          );

