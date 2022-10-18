CREATE TABLE [dbo].[BMP_DETAILEDWATERBODIES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (65)    NULL,
    [FTYPE]             NVARCHAR (24)    NULL,
    [FCODE]             INT              NULL,
    [FCODE_DESC]        NVARCHAR (65)    NULL,
    [SQKM]              NUMERIC (38, 8)  NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R77_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g67_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S67_idx]
    ON [dbo].[BMP_DETAILEDWATERBODIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

