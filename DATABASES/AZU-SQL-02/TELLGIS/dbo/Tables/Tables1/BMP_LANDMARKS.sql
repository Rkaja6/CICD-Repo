CREATE TABLE [dbo].[BMP_LANDMARKS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (150)   NULL,
    [FEATTYPE]          NVARCHAR (40)    NULL,
    [MNFC]              INT              NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R85_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g75_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S75_idx]
    ON [dbo].[BMP_LANDMARKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

