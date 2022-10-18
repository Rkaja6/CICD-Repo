CREATE TABLE [dbo].[BMP_ENV_NCED_CENTRAL_A] (
    [OBJECTID]          INT              NOT NULL,
    [unique_id]         NVARCHAR (15)    NULL,
    [security]          NVARCHAR (20)    NULL,
    [sitename]          NVARCHAR (100)   NULL,
    [esmthldr]          NVARCHAR (100)   NULL,
    [eholdtyp]          NVARCHAR (50)    NULL,
    [owntype]           NVARCHAR (50)    NULL,
    [s_emthd1]          NVARCHAR (100)   NULL,
    [s_emthd2]          NVARCHAR (100)   NULL,
    [purpose]           NVARCHAR (50)    NULL,
    [gapsts]            NVARCHAR (95)    NULL,
    [pubaccess]         NVARCHAR (20)    NULL,
    [duration]          NVARCHAR (20)    NULL,
    [term]              SMALLINT         NULL,
    [mon_est]           SMALLINT         NULL,
    [day_est]           SMALLINT         NULL,
    [year_est]          SMALLINT         NULL,
    [state]             NVARCHAR (20)    NULL,
    [dataagg]           NVARCHAR (50)    NULL,
    [dataentry]         DATETIME2 (7)    NULL,
    [datapvdr]          NVARCHAR (100)   NULL,
    [datasrc]           NVARCHAR (100)   NULL,
    [source_uid]        NVARCHAR (100)   NULL,
    [rep_acres]         NUMERIC (38, 8)  NULL,
    [gis_acres]         NUMERIC (38, 8)  NULL,
    [pct_diff]          NUMERIC (38, 8)  NULL,
    [conflict]          NVARCHAR (50)    NULL,
    [stacked]           NVARCHAR (5)     NULL,
    [iucncat]           NVARCHAR (70)    NULL,
    [wpda_cd]           INT              NULL,
    [comments]          NVARCHAR (255)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R275_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g256_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S256_idx]
    ON [dbo].[BMP_ENV_NCED_CENTRAL_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9178372.4037, XMIN = -11695449.934, YMAX = 6274949.3821, YMIN = 2979254.4054),
            CELLS_PER_OBJECT = 16
          );

