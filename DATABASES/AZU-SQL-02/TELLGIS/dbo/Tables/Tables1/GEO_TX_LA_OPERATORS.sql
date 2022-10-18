CREATE TABLE [dbo].[GEO_TX_LA_OPERATORS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
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
    [Shape_Type]        NVARCHAR (254)   NULL,
    [Line_Style]        INT              NULL,
    [Object_Id]         INT              NULL,
    [Line_Width]        INT              NULL,
    [Color_Inde]        INT              NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape_Ty_1]        NVARCHAR (254)   NULL,
    [Line_Sty_1]        INT              NULL,
    [Line_Wid_1]        INT              NULL,
    [Color_In_1]        INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R437_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g400_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S400_idx]
    ON [dbo].[GEO_TX_LA_OPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363887.6627113, XMIN = -10590828.0430056, YMAX = 3877185.59959209, YMIN = 3646965.56562638),
            CELLS_PER_OBJECT = 16
          );

