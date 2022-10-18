CREATE TABLE [dbo].[BMP_ENV_TPWD_STATE_PARKS_TX_A] (
    [OBJECTID]          INT              NOT NULL,
    [LoName]            NVARCHAR (100)   NULL,
    [BndryType]         NVARCHAR (10)    NULL,
    [County1]           NVARCHAR (25)    NULL,
    [County2]           NVARCHAR (25)    NULL,
    [County3]           NVARCHAR (25)    NULL,
    [County4]           NVARCHAR (25)    NULL,
    [CalcAcres]         NUMERIC (38, 8)  NULL,
    [Comments]          NVARCHAR (75)    NULL,
    [Availability]      NVARCHAR (50)    NULL,
    [UseType]           NVARCHAR (50)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R283_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g264_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S264_idx]
    ON [dbo].[BMP_ENV_TPWD_STATE_PARKS_TX_A] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -10461912.6268, XMIN = -11859929.242, YMAX = 4161962.766, YMIN = 2995520.0963),
            CELLS_PER_OBJECT = 16
          );

