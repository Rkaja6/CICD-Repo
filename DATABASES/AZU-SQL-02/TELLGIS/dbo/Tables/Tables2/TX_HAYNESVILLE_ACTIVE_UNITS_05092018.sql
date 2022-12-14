CREATE TABLE [dbo].[TX_HAYNESVILLE_ACTIVE_UNITS_05092018] (
    [OBJECTID]          INT              NOT NULL,
    [FIELD]             NVARCHAR (100)   NULL,
    [UNIT_NAME]         NVARCHAR (50)    NULL,
    [UNIT_ORDER]        NVARCHAR (50)    NULL,
    [APPLICANT_NAME]    NVARCHAR (40)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R70_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g60_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S60_idx]
    ON [dbo].[TX_HAYNESVILLE_ACTIVE_UNITS_05092018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

