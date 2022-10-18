CREATE TABLE [dbo].[GEO_PRODUCING_HAYNESVILLE_LATERALS] (
    [OBJECTID]          INT              NOT NULL,
    [UWI]               NVARCHAR (20)    NULL,
    [DIR_SVY_ID]        NVARCHAR (20)    NULL,
    [SRVY_SRC]          NVARCHAR (12)    NULL,
    [SRVY_CPY]          NVARCHAR (20)    NULL,
    [SRVY_DT]           DATETIME2 (7)    NULL,
    [SRVY_TYPE]         NVARCHAR (12)    NULL,
    [CALC_METH]         NVARCHAR (12)    NULL,
    [DATUM]             NVARCHAR (12)    NULL,
    [ENTITLEMENTKEY]    NVARCHAR (5)     NULL,
    [OBJ_TYPE]          NVARCHAR (5)     NULL,
    [ROTATION]          NVARCHAR (20)    NULL,
    [BN_STATUS]         NVARCHAR (5)     NULL,
    [OID]               INT              NULL,
    [OBJECTID_1]        INT              NULL,
    [Field1]            NUMERIC (38, 8)  NULL,
    [API]               NVARCHAR (50)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R46_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g36_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S36_idx]
    ON [dbo].[GEO_PRODUCING_HAYNESVILLE_LATERALS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

