CREATE TABLE [dbo].[BMP_ENV_WMA_TX_A] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (50)    NULL,
    [County1]           NVARCHAR (25)    NULL,
    [County2]           NVARCHAR (25)    NULL,
    [County3]           NVARCHAR (25)    NULL,
    [County4]           NVARCHAR (25)    NULL,
    [Owner]             NVARCHAR (50)    NULL,
    [SrcName]           NVARCHAR (50)    NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R285_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g266_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S266_idx]
    ON [dbo].[BMP_ENV_WMA_TX_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10429445.2481, XMIN = -11680678.5941, YMAX = 4326377.9868, YMIN = 2985182.3783),
            CELLS_PER_OBJECT = 16
          );

