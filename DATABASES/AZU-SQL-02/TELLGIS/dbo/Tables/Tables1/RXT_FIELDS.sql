CREATE TABLE [dbo].[RXT_FIELDS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [CNTY_NAME]         NVARCHAR (30)    NULL,
    [STATE_NAME]        NVARCHAR (30)    NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R352_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g315_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S315_idx]
    ON [dbo].[RXT_FIELDS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8692383.5169, XMIN = -16862618.078, YMAX = 10886473.7028, YMIN = 3007970.1248),
            CELLS_PER_OBJECT = 16
          );

