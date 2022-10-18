CREATE TABLE [dbo].[GEO_TX_LA_OPERATORS] (
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
    [Shape_Type]        NVARCHAR (254)   NULL,
    [Line_Style]        INT              NULL,
    [Object_Id]         INT              NULL,
    [Line_Width]        INT              NULL,
    [Color_Inde]        INT              NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape_Type_1]      NVARCHAR (254)   NULL,
    [Line_Style_1]      INT              NULL,
    [Line_Width_1]      INT              NULL,
    [Color_Inde_1]      INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R147_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g119_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S119_idx]
    ON [dbo].[GEO_TX_LA_OPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363888.3893, XMIN = -10590828.8297, YMAX = 3877186.3814, YMIN = 3646966.2798),
            CELLS_PER_OBJECT = 16
          );

