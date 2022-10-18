CREATE TABLE [dbo].[UPS_2022BUDGETWELLS_BSSR_BORE] (
    [OBJECTID]          INT              NOT NULL,
    [Drill_Orde]        NUMERIC (38, 8)  NULL,
    [Budget]            NVARCHAR (10)    NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Well_Order]        NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R640_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g603_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S603_idx]
    ON [dbo].[UPS_2022BUDGETWELLS_BSSR_BORE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10398294.9365519, XMIN = -10403810.5509341, YMAX = 3763846.30608229, YMIN = 3745014.42321269),
            CELLS_PER_OBJECT = 16
          );

