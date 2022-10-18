CREATE TABLE [dbo].[RXT_RAIL] (
    [OBJECTID]          INT              NOT NULL,
    [MAP_LABEL]         NVARCHAR (35)    NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [CLASS]             NVARCHAR (35)    NULL,
    [LINE_NAME]         NVARCHAR (50)    NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R173_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g154_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S154_idx]
    ON [dbo].[RXT_RAIL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6689817.9601, XMIN = -17605421.5926, YMAX = 9588945.4024, YMIN = 1651269.9246),
            CELLS_PER_OBJECT = 16
          );

