CREATE TABLE [dbo].[UPS_2022BUDGETWELLS_BSSR_SHL] (
    [OBJECTID]          INT              NOT NULL,
    [Drill_Orde]        NUMERIC (38, 8)  NULL,
    [Budget]            NVARCHAR (10)    NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Well_Order]        NVARCHAR (5)     NULL,
    [ORIG_FID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R639_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g602_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S602_idx]
    ON [dbo].[UPS_2022BUDGETWELLS_BSSR_SHL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10398294.936528, XMIN = -10403810.4726272, YMAX = 3763908.04429977, YMIN = 3748581.53062753),
            CELLS_PER_OBJECT = 16
          );

