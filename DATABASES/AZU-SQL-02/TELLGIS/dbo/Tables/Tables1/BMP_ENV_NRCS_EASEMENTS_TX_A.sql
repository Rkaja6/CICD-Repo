CREATE TABLE [dbo].[BMP_ENV_NRCS_EASEMENTS_TX_A] (
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
    CONSTRAINT [R278_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g259_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S259_idx]
    ON [dbo].[BMP_ENV_NRCS_EASEMENTS_TX_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10469070.8957, XMIN = -11589517.9289, YMAX = 4282699.2108, YMIN = 3001087.5935),
            CELLS_PER_OBJECT = 16
          );

