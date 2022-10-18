CREATE TABLE [dbo].[TPN_PROPOSED_CHK_LINE_B] (
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
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R244_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g225_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S225_idx]
    ON [dbo].[TPN_PROPOSED_CHK_LINE_B] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10339199.4916394, XMIN = -10493963.6243469, YMAX = 3791498.50952554, YMIN = 3552736.39953653),
            CELLS_PER_OBJECT = 16
          );

