CREATE TABLE [dbo].[GEO_TX_LA_OPERATORS_NEW] (
    [OBJECTID]          INT              NOT NULL,
    [state_pr]          NVARCHAR (254)   NULL,
    [cnty_sta]          NVARCHAR (254)   NULL,
    [DIPlay]            NVARCHAR (254)   NULL,
    [unit_nm]           NVARCHAR (254)   NULL,
    [acres]             NUMERIC (38, 8)  NULL,
    [api_10]            NVARCHAR (254)   NULL,
    [operator]          NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R567_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g530_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S530_idx]
    ON [dbo].[GEO_TX_LA_OPERATORS_NEW] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363887.6627113, XMIN = -10550379.4260387, YMAX = 3863632.67988291, YMIN = 3670374.81038279),
            CELLS_PER_OBJECT = 16
          );

