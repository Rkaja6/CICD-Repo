CREATE TABLE [dbo].[BMP_MAJORRIVERS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (40)    NULL,
    [SYSTEM]            NVARCHAR (40)    NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R87_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g77_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S77_idx]
    ON [dbo].[BMP_MAJORRIVERS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

