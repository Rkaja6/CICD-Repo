CREATE TABLE [dbo].[WELL_PITS] (
    [OBJECTID]          INT              NOT NULL,
    [PIT_TYPE]          NVARCHAR (50)    NULL,
    [WELL_SERIAL_NUM]   INT              NULL,
    [PIT_ID]            NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R103_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g93_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S93_idx]
    ON [dbo].[WELL_PITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

