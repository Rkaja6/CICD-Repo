CREATE TABLE [dbo].[BMP_BND_TIGER2016_AMERICAN_INDIAN_AREAS_A] (
    [OBJECTID]          INT              NOT NULL,
    [AIANNHCE]          NVARCHAR (4)     NULL,
    [AIANNHNS]          NVARCHAR (8)     NULL,
    [GEOID]             NVARCHAR (5)     NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [NAMELSAD]          NVARCHAR (100)   NULL,
    [LSAD]              NVARCHAR (2)     NULL,
    [CLASSFP]           NVARCHAR (2)     NULL,
    [COMPTYP]           NVARCHAR (1)     NULL,
    [AIANNHR]           NVARCHAR (1)     NULL,
    [MTFCC]             NVARCHAR (5)     NULL,
    [FUNCSTAT]          NVARCHAR (1)     NULL,
    [ALAND]             NUMERIC (38, 8)  NULL,
    [AWATER]            NUMERIC (38, 8)  NULL,
    [INTPTLAT]          NVARCHAR (11)    NULL,
    [INTPTLON]          NVARCHAR (12)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R269_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g250_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S250_idx]
    ON [dbo].[BMP_BND_TIGER2016_AMERICAN_INDIAN_AREAS_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7462359.6608, XMIN = -19395987.1877, YMAX = 11519629.6651, YMIN = 2144424.3394),
            CELLS_PER_OBJECT = 16
          );

