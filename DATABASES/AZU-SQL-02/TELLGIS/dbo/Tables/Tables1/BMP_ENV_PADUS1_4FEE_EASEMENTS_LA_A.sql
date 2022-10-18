CREATE TABLE [dbo].[BMP_ENV_PADUS1_4FEE_EASEMENTS_LA_A] (
    [OBJECTID]          INT              NOT NULL,
    [Category]          NVARCHAR (12)    NULL,
    [Own_Type]          NVARCHAR (50)    NULL,
    [Own_Name]          NVARCHAR (70)    NULL,
    [Loc_Own]           NVARCHAR (250)   NULL,
    [Mang_Type]         NVARCHAR (50)    NULL,
    [Mang_Name]         NVARCHAR (70)    NULL,
    [Loc_Mang]          NVARCHAR (250)   NULL,
    [Des_Tp]            NVARCHAR (75)    NULL,
    [Loc_Ds]            NVARCHAR (250)   NULL,
    [Unit_Nm]           NVARCHAR (250)   NULL,
    [Loc_Nm]            NVARCHAR (250)   NULL,
    [State_Nm]          NVARCHAR (50)    NULL,
    [Agg_Src]           NVARCHAR (150)   NULL,
    [GIS_Src]           NVARCHAR (200)   NULL,
    [Src_Date]          NVARCHAR (15)    NULL,
    [GIS_Acres]         INT              NULL,
    [Source_PAID]       NVARCHAR (100)   NULL,
    [WDPA_Cd]           INT              NULL,
    [Access]            NVARCHAR (20)    NULL,
    [Access_Src]        NVARCHAR (150)   NULL,
    [GAP_Sts]           NVARCHAR (95)    NULL,
    [GAPCdSrc]          NVARCHAR (150)   NULL,
    [GAPCdDt]           NVARCHAR (4)     NULL,
    [IUCN_Cat]          NVARCHAR (70)    NULL,
    [IUCNCtSrc]         NVARCHAR (150)   NULL,
    [IUCNCtDt]          NVARCHAR (4)     NULL,
    [Date_Est]          NVARCHAR (4)     NULL,
    [Comments]          NVARCHAR (255)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R279_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g260_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S260_idx]
    ON [dbo].[BMP_ENV_PADUS1_4FEE_EASEMENTS_LA_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9886720.7946, XMIN = -10468807.896, YMAX = 3897869.8468, YMIN = 3366721.7875),
            CELLS_PER_OBJECT = 16
          );

