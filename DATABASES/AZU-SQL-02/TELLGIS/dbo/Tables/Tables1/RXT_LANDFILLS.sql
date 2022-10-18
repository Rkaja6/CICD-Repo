CREATE TABLE [dbo].[RXT_LANDFILLS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [CITY]              NVARCHAR (50)    NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R750_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g713_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S713_idx]
    ON [dbo].[RXT_LANDFILLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

