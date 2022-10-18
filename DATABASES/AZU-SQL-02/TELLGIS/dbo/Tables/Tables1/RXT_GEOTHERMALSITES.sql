CREATE TABLE [dbo].[RXT_GEOTHERMALSITES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (10)    NULL,
    [PH]                NUMERIC (38, 8)  NULL,
    [DEPTH_M]           NUMERIC (38, 8)  NULL,
    [DEPTH_FT]          NUMERIC (38, 8)  NULL,
    [FLOW_LPM]          NUMERIC (38, 8)  NULL,
    [FLOW_GPM]          NUMERIC (38, 8)  NULL,
    [TDS_MGPL]          NUMERIC (38, 8)  NULL,
    [RES_TEMP_C]        NUMERIC (38, 8)  NULL,
    [RES_TEMP_F]        NUMERIC (38, 8)  NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R747_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g710_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S710_idx]
    ON [dbo].[RXT_GEOTHERMALSITES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

