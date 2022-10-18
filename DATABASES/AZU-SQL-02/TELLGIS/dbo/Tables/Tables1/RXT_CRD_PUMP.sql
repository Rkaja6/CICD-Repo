CREATE TABLE [dbo].[RXT_CRD_PUMP] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [COMMODITY]         NVARCHAR (5)     NULL,
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
    CONSTRAINT [R150_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g131_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S131_idx]
    ON [dbo].[RXT_CRD_PUMP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8064139.2754, XMIN = -16761118.8491, YMAX = 11152236.3399, YMIN = 3079762.6474),
            CELLS_PER_OBJECT = 16
          );

