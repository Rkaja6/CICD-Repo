CREATE TABLE [dbo].[GEO_PRODUCING_HAYNESVILLE_SHL] (
    [OBJECTID]          INT              NOT NULL,
    [UWI]               NVARCHAR (20)    NULL,
    [API_UNIQUE]        NVARCHAR (5)     NULL,
    [WELL_NUM]          NVARCHAR (20)    NULL,
    [LEASE]             NVARCHAR (60)    NULL,
    [TD]                NVARCHAR (20)    NULL,
    [TD_FM]             NVARCHAR (20)    NULL,
    [FINAL_STAT]        NVARCHAR (12)    NULL,
    [OPERATOR]          NVARCHAR (60)    NULL,
    [FIELD]             NVARCHAR (30)    NULL,
    [PLOT_SYM]          NVARCHAR (2)     NULL,
    [WELL_NAME]         NVARCHAR (80)    NULL,
    [FINAL_CODE]        NVARCHAR (12)    NULL,
    [HOLE_DIR]          NVARCHAR (12)    NULL,
    [LL_SOURCE]         NVARCHAR (12)    NULL,
    [WELL_SRC]          NVARCHAR (12)    NULL,
    [CURR_OPER]         NVARCHAR (60)    NULL,
    [PRD_STATUS]        NVARCHAR (12)    NULL,
    [PRD_TYPE]          NVARCHAR (12)    NULL,
    [PLAY]              NVARCHAR (60)    NULL,
    [PLAY_TYPE]         NVARCHAR (12)    NULL,
    [OID]               INT              NULL,
    [OBJECTID_1]        INT              NULL,
    [Field1]            NUMERIC (38, 8)  NULL,
    [API]               NVARCHAR (50)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R45_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g35_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S35_idx]
    ON [dbo].[GEO_PRODUCING_HAYNESVILLE_SHL] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

