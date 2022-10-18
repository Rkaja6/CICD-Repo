CREATE TABLE [dbo].[RXT_BIOMASS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [POP]               NUMERIC (38, 8)  NULL,
    [FOREST]            INT              NULL,
    [PRIMMILL]          INT              NULL,
    [SECMILL]           INT              NULL,
    [URBANWOOD]         INT              NULL,
    [CROPRES]           NUMERIC (38, 8)  NULL,
    [WWTF]              NUMERIC (38, 8)  NULL,
    [LANDFILL]          NUMERIC (38, 8)  NULL,
    [MANURE]            NUMERIC (38, 8)  NULL,
    [SWG]               NUMERIC (38, 8)  NULL,
    [TOTAL]             NUMERIC (38, 8)  NULL,
    [TOTAL_SQKM]        NUMERIC (38, 8)  NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R741_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g704_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S704_idx]
    ON [dbo].[RXT_BIOMASS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

