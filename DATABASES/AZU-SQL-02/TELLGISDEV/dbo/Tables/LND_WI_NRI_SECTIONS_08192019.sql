CREATE TABLE [dbo].[LND_WI_NRI_SECTIONS_08192019] (
    [OBJECTID]          INT              NOT NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [OBJECTID_12]       INT              NULL,
    [Section_]          NUMERIC (38, 8)  NULL,
    [Township_1]        NVARCHAR (255)   NULL,
    [Range_1]           NVARCHAR (255)   NULL,
    [HVILLE_WI]         NUMERIC (38, 8)  NULL,
    [HVILLE_RI]         NUMERIC (38, 8)  NULL,
    [BOS_WI]            NUMERIC (38, 8)  NULL,
    [BOS_RI]            NUMERIC (38, 8)  NULL,
    [S_T_R_12]          NVARCHAR (25)    NULL,
    [Operator]          NVARCHAR (50)    NULL,
    [WI]                NUMERIC (38, 8)  NULL,
    [NRI]               NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R127_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g99_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S99_idx]
    ON [dbo].[LND_WI_NRI_SECTIONS_08192019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10375303.9887939, XMIN = -10468793.4889765, YMAX = 3821081.25009445, YMIN = 3723955.48222798),
            CELLS_PER_OBJECT = 16
          );

