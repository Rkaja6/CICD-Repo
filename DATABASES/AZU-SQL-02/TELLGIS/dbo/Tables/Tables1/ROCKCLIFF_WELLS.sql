CREATE TABLE [dbo].[ROCKCLIFF_WELLS] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [Unit]              NVARCHAR (50)    NULL,
    [Well_Name]         NVARCHAR (50)    NULL,
    [Well_Type]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R50_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g40_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S40_idx]
    ON [dbo].[ROCKCLIFF_WELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

