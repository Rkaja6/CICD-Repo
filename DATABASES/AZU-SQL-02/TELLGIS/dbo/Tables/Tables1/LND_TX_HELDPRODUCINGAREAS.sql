CREATE TABLE [dbo].[LND_TX_HELDPRODUCINGAREAS] (
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
    CONSTRAINT [R783_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g746_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S746_idx]
    ON [dbo].[LND_TX_HELDPRODUCINGAREAS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10442501.00141, XMIN = -10567630.7782123, YMAX = 3864445.86977582, YMIN = 3643613.80210075)
          );

