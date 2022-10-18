CREATE TABLE [dbo].[BMP_RAILROADS100K] (
    [OBJECTID]          INT              NOT NULL,
    [ID]                INT              NULL,
    [RAILROAD]          NVARCHAR (31)    NULL,
    [RROWNER]           NVARCHAR (4)     NULL,
    [TR]                NVARCHAR (4)     NULL,
    [PASSENGER]         NVARCHAR (4)     NULL,
    [MILITARY]          NVARCHAR (1)     NULL,
    [FRA_REG]           NVARCHAR (2)     NULL,
    [CLASS]             NVARCHAR (1)     NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R301_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g282_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S282_idx]
    ON [dbo].[BMP_RAILROADS100K] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7488234.26455798, XMIN = -13832391.934767, YMAX = 6275180.84458859, YMIN = 2932655.64884041),
            CELLS_PER_OBJECT = 16
          );

