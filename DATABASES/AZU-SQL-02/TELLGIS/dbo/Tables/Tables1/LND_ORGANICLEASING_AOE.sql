CREATE TABLE [dbo].[LND_ORGANICLEASING_AOE] (
    [OBJECTID]            INT              NOT NULL,
    [SECTN]               NVARCHAR (12)    NULL,
    [TOWNSHIP]            NVARCHAR (12)    NULL,
    [RANGE]               NVARCHAR (12)    NULL,
    [S_T_R]               NVARCHAR (25)    NULL,
    [Adjusted_To_Survey]  NVARCHAR (50)    NULL,
    [TRS]                 NVARCHAR (25)    NULL,
    [sec]                 NVARCHAR (10)    NULL,
    [twp]                 NVARCHAR (10)    NULL,
    [rng]                 NVARCHAR (10)    NULL,
    [no]                  SMALLINT         NULL,
    [MAP]                 NVARCHAR (5)     NULL,
    [OBJECTID_1]          INT              NULL,
    [Category]            NVARCHAR (255)   NULL,
    [Section]             NUMERIC (38, 8)  NULL,
    [Township_1]          NVARCHAR (255)   NULL,
    [Range_1]             NVARCHAR (255)   NULL,
    [Priority]            NUMERIC (38, 8)  NULL,
    [Open_Acres]          NUMERIC (38, 8)  NULL,
    [Third_Party_Acreage] NUMERIC (38, 8)  NULL,
    [Comments]            NVARCHAR (255)   NULL,
    [STR]                 NVARCHAR (50)    NULL,
    [Shape]               [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]   VARBINARY (MAX)  NULL,
    CONSTRAINT [R653_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g616_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S616_idx]
    ON [dbo].[LND_ORGANICLEASING_AOE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10379075.8816746, XMIN = -10432182.4891434, YMAX = 3823065.39208639, YMIN = 3727784.73374843),
            CELLS_PER_OBJECT = 16
          );

