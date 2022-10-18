CREATE TABLE [dbo].[RXT_ELEC_SUBSTATIONS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [KV_MAX]            SMALLINT         NULL,
    [CIRCUITS]          SMALLINT         NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R152_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g133_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S133_idx]
    ON [dbo].[RXT_ELEC_SUBSTATIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7490836.0769, XMIN = -13871700.0827, YMAX = 6273685.7279, YMIN = 2823711.9404),
            CELLS_PER_OBJECT = 16
          );

