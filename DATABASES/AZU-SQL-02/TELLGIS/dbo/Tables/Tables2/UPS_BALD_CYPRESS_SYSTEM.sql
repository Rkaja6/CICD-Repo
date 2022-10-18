CREATE TABLE [dbo].[UPS_BALD_CYPRESS_SYSTEM] (
    [OBJECTID]          INT              NOT NULL,
    [OID_]              INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Dia]               INT              NULL,
    [LENGTH_GEO]        NUMERIC (38, 8)  NULL,
    [Modified]          NVARCHAR (50)    NULL,
    [Agreement_]        NVARCHAR (50)    NULL,
    [CAD_NO]            NVARCHAR (50)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R628_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g591_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S591_idx]
    ON [dbo].[UPS_BALD_CYPRESS_SYSTEM] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388430.2850097, XMIN = -10392291.9067342, YMAX = 3786596.63447198, YMIN = 3784634.30090654),
            CELLS_PER_OBJECT = 16
          );

