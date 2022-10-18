CREATE TABLE [dbo].[RXT_NG_PRPLANT] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (300)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [CAPACITY]          NUMERIC (38, 8)  NULL,
    [THROUGHPUT]        NUMERIC (38, 8)  NULL,
    [NGL_STORAGE]       INT              NULL,
    [BTU]               INT              NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (400)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R164_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g145_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S145_idx]
    ON [dbo].[RXT_NG_PRPLANT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6858737.3508, XMIN = -13705236.5997, YMAX = 8387987.1425, YMIN = 2021489.2055),
            CELLS_PER_OBJECT = 16
          );

