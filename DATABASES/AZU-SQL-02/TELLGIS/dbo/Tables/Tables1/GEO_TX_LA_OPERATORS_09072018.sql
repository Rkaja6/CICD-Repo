CREATE TABLE [dbo].[GEO_TX_LA_OPERATORS_09072018] (
    [OBJECTID_1]        INT              NOT NULL,
    [operator]          NVARCHAR (254)   NULL,
    [unit_nm]           NVARCHAR (254)   NULL,
    [api_10]            NVARCHAR (254)   NULL,
    [wellstat]          NVARCHAR (254)   NULL,
    [instrum]           NVARCHAR (254)   NULL,
    [abstract]          NVARCHAR (254)   NULL,
    [acres]             NUMERIC (38, 8)  NULL,
    [state_pr]          NVARCHAR (254)   NULL,
    [cnty_par]          NVARCHAR (254)   NULL,
    [cnty_sta]          NVARCHAR (254)   NULL,
    [api_sta]           NVARCHAR (254)   NULL,
    [api_cnty]          NVARCHAR (254)   NULL,
    [unit_id]           INT              NULL,
    [cent_lat]          NUMERIC (38, 8)  NULL,
    [cent_lon]          NUMERIC (38, 8)  NULL,
    [Formation]         NVARCHAR (50)    NULL,
    [OBJECTID]          INT              NULL,
    [NAME]              NVARCHAR (30)    NULL,
    [PERMIT_ACR]        NUMERIC (38, 8)  NULL,
    [CALC_ACRES]        NUMERIC (38, 8)  NULL,
    [OPERATED]          NVARCHAR (1)     NULL,
    [FIELD]             NVARCHAR (25)    NULL,
    [STATE]             NVARCHAR (25)    NULL,
    [COUNTY]            NVARCHAR (25)    NULL,
    [Shape_Type]        NVARCHAR (254)   NULL,
    [Line_Style]        INT              NULL,
    [Line_Width]        INT              NULL,
    [Color_Inde]        INT              NULL,
    [Entity]            NVARCHAR (16)    NULL,
    [Layer]             NVARCHAR (254)   NULL,
    [Color]             INT              NULL,
    [Linetype]          NVARCHAR (254)   NULL,
    [Elevation]         NUMERIC (38, 8)  NULL,
    [LineWt]            INT              NULL,
    [RefName]           NVARCHAR (254)   NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Tier]              NVARCHAR (50)    NULL,
    [Object_Id]         INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R216_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g197_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S197_idx]
    ON [dbo].[GEO_TX_LA_OPERATORS_09072018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10363869.4753, XMIN = -10553081.2318, YMAX = 3863613.7635, YMIN = 3677185.63),
            CELLS_PER_OBJECT = 16
          );

