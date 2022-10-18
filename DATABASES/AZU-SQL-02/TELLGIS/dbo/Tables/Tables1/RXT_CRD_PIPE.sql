CREATE TABLE [dbo].[RXT_CRD_PIPE] (
    [OBJECTID]          INT              NOT NULL,
    [MAP_LABEL]         NVARCHAR (35)    NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [SYS_NAME]          NVARCHAR (75)    NULL,
    [DIAMETER]          SMALLINT         NULL,
    [SYS_TYPE]          NVARCHAR (15)    NULL,
    [INTERSTATE]        NVARCHAR (3)     NULL,
    [RATE_ZONE]         NVARCHAR (50)    NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [COMMODITY]         NVARCHAR (5)     NULL,
    [FLOW_DIR]          NVARCHAR (2)     NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R148_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g129_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S129_idx]
    ON [dbo].[RXT_CRD_PIPE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7353983.3909, XMIN = -17262238.5209, YMAX = 11237021.3409, YMIN = 1766009.5459),
            CELLS_PER_OBJECT = 16
          );

