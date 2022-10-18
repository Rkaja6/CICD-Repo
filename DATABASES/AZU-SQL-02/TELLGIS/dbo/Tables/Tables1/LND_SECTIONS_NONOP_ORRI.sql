CREATE TABLE [dbo].[LND_SECTIONS_NONOP_ORRI] (
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
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R303_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g284_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S284_idx]
    ON [dbo].[LND_SECTIONS_NONOP_ORRI] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10392365.9709992, XMIN = -10394288.8485043, YMAX = 3786680.84726801, YMIN = 3784730.87697178),
            CELLS_PER_OBJECT = 16
          );

