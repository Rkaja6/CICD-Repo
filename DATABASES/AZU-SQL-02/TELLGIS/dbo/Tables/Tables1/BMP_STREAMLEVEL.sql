CREATE TABLE [dbo].[BMP_STREAMLEVEL] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (65)    NULL,
    [FTYPE]             NVARCHAR (60)    NULL,
    [FCODE]             INT              NULL,
    [FCODE_DESC]        NVARCHAR (60)    NULL,
    [STRM_LEVEL]        INT              NULL,
    [AP_WITHIN]         NVARCHAR (24)    NULL,
    [METERS]            NUMERIC (38, 8)  NULL,
    [FEET]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R97_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g87_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S87_idx]
    ON [dbo].[BMP_STREAMLEVEL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

