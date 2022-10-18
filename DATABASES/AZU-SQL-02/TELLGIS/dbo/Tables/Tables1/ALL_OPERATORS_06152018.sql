CREATE TABLE [dbo].[ALL_OPERATORS_06152018] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
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
    [Entity]            NVARCHAR (16)    NULL,
    [Layer]             NVARCHAR (254)   NULL,
    [Color]             INT              NULL,
    [Linetype]          NVARCHAR (254)   NULL,
    [Elevation]         NUMERIC (38, 8)  NULL,
    [LineWt]            INT              NULL,
    [RefName]           NVARCHAR (254)   NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R14_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g4_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S4_idx]
    ON [dbo].[ALL_OPERATORS_06152018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

