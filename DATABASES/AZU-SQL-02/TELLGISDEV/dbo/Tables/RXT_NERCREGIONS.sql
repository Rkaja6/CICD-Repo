CREATE TABLE [dbo].[RXT_NERCREGIONS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (80)    NULL,
    [WEBSITE]           NVARCHAR (250)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R262_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g234_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S234_idx]
    ON [dbo].[RXT_NERCREGIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

