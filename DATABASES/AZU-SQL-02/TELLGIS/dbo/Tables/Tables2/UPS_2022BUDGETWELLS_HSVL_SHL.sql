CREATE TABLE [dbo].[UPS_2022BUDGETWELLS_HSVL_SHL] (
    [OBJECTID]          INT              NOT NULL,
    [Drill_Or_1]        NUMERIC (38, 8)  NULL,
    [Budget]            NVARCHAR (10)    NULL,
    [MAP_LABEL]         NVARCHAR (50)    NULL,
    [Well_Order]        NVARCHAR (5)     NULL,
    [ORIG_FID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R638_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g601_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S601_idx]
    ON [dbo].[UPS_2022BUDGETWELLS_HSVL_SHL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10391510.7895058, XMIN = -10404512.1398785, YMAX = 3782948.58030001, YMIN = 3756467.98330866),
            CELLS_PER_OBJECT = 16
          );

