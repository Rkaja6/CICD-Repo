CREATE TABLE [dbo].[BMP_PARKS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (150)   NULL,
    [FEATTYPE]          NVARCHAR (40)    NULL,
    [MNFC]              INT              NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R91_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g81_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S81_idx]
    ON [dbo].[BMP_PARKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

