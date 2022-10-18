CREATE TABLE [dbo].[BMP_WORLDPOPPLACES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (50)    NULL,
    [ISO_CC]            NVARCHAR (2)     NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [RANK]              SMALLINT         NULL,
    [POPULATION]        NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R197_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g178_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S178_idx]
    ON [dbo].[BMP_WORLDPOPPLACES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19948368.2376674, XMIN = -19503626.0413725, YMAX = 10904260.5128852, YMIN = -7129568.21559136),
            CELLS_PER_OBJECT = 16
          );

