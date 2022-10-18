CREATE TABLE [dbo].[BMP_AIRPORTP] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (150)   NULL,
    [FEATTYPE]          NVARCHAR (40)    NULL,
    [MNFC]              INT              NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R205_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g186_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S186_idx]
    ON [dbo].[BMP_AIRPORTP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7345046.6921, XMIN = -19117558.2711, YMAX = 11501839.5989, YMIN = 2037993.0987),
            CELLS_PER_OBJECT = 16
          );

