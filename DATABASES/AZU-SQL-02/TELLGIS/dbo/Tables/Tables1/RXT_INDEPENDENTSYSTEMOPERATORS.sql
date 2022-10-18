CREATE TABLE [dbo].[RXT_INDEPENDENTSYSTEMOPERATORS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (60)    NULL,
    [NAICS_CODE]        NVARCHAR (4)     NULL,
    [NAICS_DESC]        NVARCHAR (56)    NULL,
    [WEBSITE]           NVARCHAR (27)    NULL,
    [PEAK_LOAD]         NUMERIC (38, 8)  NULL,
    [AVG_LOAD]          NUMERIC (38, 8)  NULL,
    [YEAR]              NVARCHAR (4)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R749_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g712_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S712_idx]
    ON [dbo].[RXT_INDEPENDENTSYSTEMOPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

