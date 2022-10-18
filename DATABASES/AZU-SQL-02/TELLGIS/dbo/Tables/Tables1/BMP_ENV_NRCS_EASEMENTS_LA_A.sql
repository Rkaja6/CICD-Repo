CREATE TABLE [dbo].[BMP_ENV_NRCS_EASEMENTS_LA_A] (
    [OBJECTID]               INT              NOT NULL,
    [Admin_Area]             NVARCHAR (2)     NULL,
    [Method]                 NVARCHAR (20)    NULL,
    [Scale]                  NVARCHAR (25)    NULL,
    [CalcAcres]              NUMERIC (38, 8)  NULL,
    [NEST_STATE]             NVARCHAR (255)   NULL,
    [NEST_County]            NVARCHAR (255)   NULL,
    [NEST_PROGRAM]           NVARCHAR (255)   NULL,
    [NEST_EASEMENT_DURATION] NVARCHAR (255)   NULL,
    [NEST_C_CLOSING_DATE]    DATETIME2 (7)    NULL,
    [Disclaimer]             NVARCHAR (200)   NULL,
    [Shape]                  [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]      VARBINARY (MAX)  NULL,
    CONSTRAINT [R277_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g258_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S258_idx]
    ON [dbo].[BMP_ENV_NRCS_EASEMENTS_LA_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9989983.947, XMIN = -10451519.4696, YMAX = 3897869.0621, YMIN = 3451021.988),
            CELLS_PER_OBJECT = 16
          );

