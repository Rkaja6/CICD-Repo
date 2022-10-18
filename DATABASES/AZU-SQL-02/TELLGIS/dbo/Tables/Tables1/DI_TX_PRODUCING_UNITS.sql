CREATE TABLE [dbo].[DI_TX_PRODUCING_UNITS] (
    [OBJECTID]          INT              NOT NULL,
    [daapUnitId]        NUMERIC (38, 8)  NULL,
    [Instrument]        NVARCHAR (64)    NULL,
    [Abstract]          NVARCHAR (64)    NULL,
    [UnitName]          NVARCHAR (64)    NULL,
    [Acres]             NUMERIC (38, 8)  NULL,
    [Operator]          NVARCHAR (64)    NULL,
    [API]               NVARCHAR (64)    NULL,
    [priorWellStatus]   NVARCHAR (64)    NULL,
    [currentWellStatus] NVARCHAR (255)   NULL,
    [state]             NVARCHAR (5)     NULL,
    [countyName]        NVARCHAR (64)    NULL,
    [ApiSt]             NVARCHAR (5)     NULL,
    [ApiCty]            NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R525_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g488_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S488_idx]
    ON [dbo].[DI_TX_PRODUCING_UNITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8408810.5964, XMIN = -12079509.9446, YMAX = 6274778.0251, YMIN = 3003733.0846),
            CELLS_PER_OBJECT = 16
          );

