CREATE TABLE [dbo].[LNG_DRIFTWOODFACILITIES] (
    [OBJECTID]          INT              NOT NULL,
    [Entity]            NVARCHAR (16)    NULL,
    [Handle]            NVARCHAR (16)    NULL,
    [Level_]            INT              NULL,
    [Layer]             NVARCHAR (255)   NULL,
    [LvlDesc]           NVARCHAR (255)   NULL,
    [LyrFrzn]           SMALLINT         NULL,
    [LyrLock]           SMALLINT         NULL,
    [LyrOn]             SMALLINT         NULL,
    [LvlPlot]           SMALLINT         NULL,
    [Color]             SMALLINT         NULL,
    [EntColor]          SMALLINT         NULL,
    [LyrColor]          SMALLINT         NULL,
    [Linetype]          NVARCHAR (255)   NULL,
    [EntLinetype]       NVARCHAR (255)   NULL,
    [LyrLnType]         NVARCHAR (255)   NULL,
    [Elevation]         NUMERIC (38, 8)  NULL,
    [Class]             NVARCHAR (24)    NULL,
    [GGroup]            SMALLINT         NULL,
    [CadModel]          NVARCHAR (255)   NULL,
    [Fill]              SMALLINT         NULL,
    [LineWt]            SMALLINT         NULL,
    [EntLineWt]         SMALLINT         NULL,
    [LyrLineWt]         SMALLINT         NULL,
    [RefName]           NVARCHAR (255)   NULL,
    [LTScale]           NUMERIC (38, 8)  NULL,
    [QrotW]             NUMERIC (38, 8)  NULL,
    [QrotX]             NUMERIC (38, 8)  NULL,
    [QrotY]             NUMERIC (38, 8)  NULL,
    [QrotZ]             NUMERIC (38, 8)  NULL,
    [DocName]           NVARCHAR (255)   NULL,
    [DocPath]           NVARCHAR (MAX)   NULL,
    [DocType]           NVARCHAR (32)    NULL,
    [DocVer]            NVARCHAR (16)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R264_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g245_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S245_idx]
    ON [dbo].[LNG_DRIFTWOODFACILITIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388566.4431, XMIN = -10391747.1501, YMAX = 3517002.0536, YMIN = 3514273.2976),
            CELLS_PER_OBJECT = 16
          );

