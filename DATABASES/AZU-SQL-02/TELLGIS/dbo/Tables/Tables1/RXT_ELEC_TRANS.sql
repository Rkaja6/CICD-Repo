CREATE TABLE [dbo].[RXT_ELEC_TRANS] (
    [OBJECTID]          INT              NOT NULL,
    [MAP_LABEL]         NVARCHAR (35)    NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [KV]                SMALLINT         NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [CURRENT_]          NVARCHAR (5)     NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [KV_CONF]           SMALLINT         NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R153_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g134_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S134_idx]
    ON [dbo].[RXT_ELEC_TRANS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7489879.8582, XMIN = -13878122.6827, YMAX = 6275282.4724, YMIN = 2821401.6295),
            CELLS_PER_OBJECT = 16
          );

