CREATE TABLE [dbo].[DI_WELLLOGS] (
    [OBJECTID]          INT              NOT NULL,
    [state]             NVARCHAR (5)     NOT NULL,
    [countyName]        NVARCHAR (63)    NOT NULL,
    [WellLogID]         INT              NULL,
    [UWI]               NVARCHAR (16)    NULL,
    [Scanned]           INT              NULL,
    [LAS]               INT              NULL,
    [WellName]          NVARCHAR (64)    NULL,
    [Operator]          NVARCHAR (100)   NULL,
    [CurveType]         NVARCHAR (MAX)   NULL,
    [LONGITUDE]         NUMERIC (38, 8)  NULL,
    [LATITUDE]          NUMERIC (38, 8)  NULL,
    [LogDate]           NVARCHAR (25)    NULL,
    [StartDpth]         NVARCHAR (15)    NULL,
    [StopDpth]          NVARCHAR (15)    NULL,
    [WellNumber]        NVARCHAR (32)    NULL,
    [Elevation]         INT              NULL,
    [TotalDpth]         INT              NULL,
    [LogType]           NVARCHAR (MAX)   NULL,
    [WellLogCount]      INT              NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R527_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g490_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S490_idx]
    ON [dbo].[DI_WELLLOGS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -8340527.3359, XMIN = -13823721.8938, YMAX = 6274618.5689, YMIN = 2982686.8505),
            CELLS_PER_OBJECT = 16
          );

