CREATE TABLE [dbo].[BMP_FN_T_E_CRITICAL_HABITAT_A] (
    [OBJECTID_1]        INT              NOT NULL,
    [singlmulti]        NVARCHAR (254)   NULL,
    [comname]           NVARCHAR (200)   NULL,
    [sciname]           NVARCHAR (200)   NULL,
    [spcode]            NVARCHAR (4)     NULL,
    [vipcode]           NVARCHAR (3)     NULL,
    [unit]              NVARCHAR (254)   NULL,
    [subunit]           NVARCHAR (254)   NULL,
    [unitname]          NVARCHAR (254)   NULL,
    [subunitnam]        NVARCHAR (254)   NULL,
    [status]            NVARCHAR (254)   NULL,
    [leadoffice]        INT              NULL,
    [coopoffice]        NVARCHAR (254)   NULL,
    [coopofmore]        NVARCHAR (254)   NULL,
    [fedreg]            NVARCHAR (254)   NULL,
    [pubdate]           NVARCHAR (254)   NULL,
    [effectdate]        NVARCHAR (254)   NULL,
    [vacatedate]        NVARCHAR (254)   NULL,
    [accuracy]          NVARCHAR (254)   NULL,
    [source_id]         INT              NULL,
    [objectid]          INT              NULL,
    [listing_st]        NVARCHAR (100)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R286_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g267_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S267_idx]
    ON [dbo].[BMP_FN_T_E_CRITICAL_HABITAT_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 11178094.3885, YMIN = 1532914.4002),
            CELLS_PER_OBJECT = 16
          );

