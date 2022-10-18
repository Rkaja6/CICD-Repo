CREATE TABLE [dbo].[WEL_TELLLATERALS_PDP_OP_NONOP] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [UWI]               NVARCHAR (20)    NULL,
    [DIR_SVY_ID]        NVARCHAR (20)    NULL,
    [SRVY_SRC]          NVARCHAR (12)    NULL,
    [SRVY_CPY]          NVARCHAR (20)    NULL,
    [SRVY_DT]           DATETIME2 (7)    NULL,
    [SRVY_TYPE]         NVARCHAR (12)    NULL,
    [CALC_METH]         NVARCHAR (12)    NULL,
    [DATUM]             NVARCHAR (12)    NULL,
    [ENTITLEMEN]        NVARCHAR (5)     NULL,
    [OBJ_TYPE]          NVARCHAR (5)     NULL,
    [ROTATION]          NVARCHAR (20)    NULL,
    [BN_STATUS]         NVARCHAR (5)     NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Type]              NVARCHAR (25)    NULL,
    [Name]              NVARCHAR (50)    NULL,
    [OPERATOR]          NVARCHAR (25)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R406_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g369_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S369_idx]
    ON [dbo].[WEL_TELLLATERALS_PDP_OP_NONOP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10382693.6421746, XMIN = -10403842.1301068, YMAX = 3786592.80678404, YMIN = 3743262.69027224),
            CELLS_PER_OBJECT = 16
          );

