CREATE TABLE [dbo].[SECTIONS] (
    [OBJECTID]          INT              NOT NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [HYPERLINK]         NVARCHAR (200)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R52_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g42_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S42_idx]
    ON [dbo].[SECTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9880539.2907, XMIN = -10468836.2188, YMAX = 3897901.5947, YMIN = 3375674.4766),
            CELLS_PER_OBJECT = 16
          );

