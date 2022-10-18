CREATE TABLE [dbo].[SECTIONSLINK] (
    [OBJECTID]          INT              NOT NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [HYPERLINK]         NVARCHAR (200)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R53_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g43_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S43_idx]
    ON [dbo].[SECTIONSLINK] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

