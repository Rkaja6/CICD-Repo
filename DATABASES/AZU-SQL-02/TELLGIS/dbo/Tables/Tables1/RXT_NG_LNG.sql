CREATE TABLE [dbo].[RXT_NG_LNG] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [CAP_R_SEND]        NUMERIC (38, 8)  NULL,
    [CAP_R_UNL]         NUMERIC (38, 8)  NULL,
    [CAP_L_SEND]        NUMERIC (38, 8)  NULL,
    [CAP_L_UNL]         NUMERIC (38, 8)  NULL,
    [CAP_STO]           NUMERIC (38, 8)  NULL,
    [TANKS]             SMALLINT         NULL,
    [WEBSITE]           NVARCHAR (150)   NULL,
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
    CONSTRAINT [R159_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g140_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S140_idx]
    ON [dbo].[RXT_NG_LNG] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6860435.91, XMIN = -17330510.0087, YMAX = 8552566.9368, YMIN = 2156112.1678),
            CELLS_PER_OBJECT = 16
          );

