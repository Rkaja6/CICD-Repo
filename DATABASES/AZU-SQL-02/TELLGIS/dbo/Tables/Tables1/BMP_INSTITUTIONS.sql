CREATE TABLE [dbo].[BMP_INSTITUTIONS] (
    [OBJECTID]          INT              NOT NULL,
    [STCTYFIPS]         NVARCHAR (5)     NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [FEATTYPE]          NVARCHAR (50)    NULL,
    [MNFC]              SMALLINT         NULL,
    [TEXTLENGTH]        SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R84_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g74_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S74_idx]
    ON [dbo].[BMP_INSTITUTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

