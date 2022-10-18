CREATE TABLE [dbo].[RXT_NG_STORAGE] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [RESERVOIR]         NVARCHAR (26)    NULL,
    [AGA_REGION]        NVARCHAR (14)    NULL,
    [FLDCAPBCF]         NUMERIC (38, 8)  NULL,
    [FLDCAPMMCF]        NUMERIC (38, 8)  NULL,
    [CAPWKGBCF]         NUMERIC (38, 8)  NULL,
    [CAPWKGMMCF]        NUMERIC (38, 8)  NULL,
    [MAXDELBCF]         NUMERIC (38, 8)  NULL,
    [MAXDELMMCF]        NUMERIC (38, 8)  NULL,
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
    CONSTRAINT [R165_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g146_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S146_idx]
    ON [dbo].[RXT_NG_STORAGE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7592899.8151, XMIN = -16839873.7116, YMAX = 8686972.2927, YMIN = 3086261.2213),
            CELLS_PER_OBJECT = 16
          );

