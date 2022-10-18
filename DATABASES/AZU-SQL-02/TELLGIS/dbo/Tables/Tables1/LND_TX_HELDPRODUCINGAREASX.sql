CREATE TABLE [dbo].[LND_TX_HELDPRODUCINGAREASX] (
    [OBJECTID]          INT              NOT NULL,
    [state_pr]          NVARCHAR (254)   NULL,
    [cnty_sta]          NVARCHAR (254)   NULL,
    [DIBasin]           NVARCHAR (254)   NULL,
    [DIPlay]            NVARCHAR (254)   NULL,
    [DISubplay]         NVARCHAR (254)   NULL,
    [unit_nm]           NVARCHAR (254)   NULL,
    [acres]             NUMERIC (38, 8)  NULL,
    [api_10]            NVARCHAR (254)   NULL,
    [operator]          NVARCHAR (254)   NULL,
    [wellstat]          NVARCHAR (254)   NULL,
    [instrum]           NVARCHAR (254)   NULL,
    [abstract]          NVARCHAR (254)   NULL,
    [unit_id]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R660_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g623_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S623_idx]
    ON [dbo].[LND_TX_HELDPRODUCINGAREASX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10445742.9032645, XMIN = -10547166.6312491, YMAX = 3855322.22534499, YMIN = 3668797.74289),
            CELLS_PER_OBJECT = 16
          );

