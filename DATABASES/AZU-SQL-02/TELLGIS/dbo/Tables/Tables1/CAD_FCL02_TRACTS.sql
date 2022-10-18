CREATE TABLE [dbo].[CAD_FCL02_TRACTS] (
    [OBJECTID]          INT              NOT NULL,
    [TractName]         NVARCHAR (75)    NULL,
    [TractType]         INT              NULL,
    [FeatureNam]        NVARCHAR (50)    NULL,
    [FeatureCat]        NVARCHAR (50)    NULL,
    [FeatureUse]        NVARCHAR (50)    NULL,
    [TaxID]             NVARCHAR (75)    NULL,
    [TaxID2]            NVARCHAR (75)    NULL,
    [State]             NVARCHAR (2)     NULL,
    [County]            NVARCHAR (35)    NULL,
    [Misc]              NVARCHAR (100)   NULL,
    [Comments]          NVARCHAR (254)   NULL,
    [Offline]           INT              NULL,
    [OldShape]          INT              NULL,
    [FeatureOff]        INT              NULL,
    [ModifiedDa]        DATETIME2 (7)    NULL,
    [RouteName]         NVARCHAR (50)    NULL,
    [Spread]            NVARCHAR (50)    NULL,
    [PIN]               NVARCHAR (50)    NULL,
    [Owner_Name]        NVARCHAR (254)   NULL,
    [Owner_Addr]        NVARCHAR (254)   NULL,
    [Owner_City]        NVARCHAR (50)    NULL,
    [Owner_Stat]        NVARCHAR (50)    NULL,
    [Owner_Zip]         NVARCHAR (50)    NULL,
    [Legal_Desc]        NVARCHAR (254)   NULL,
    [AssetName]         NVARCHAR (254)   NULL,
    [Client_Tra]        NVARCHAR (50)    NULL,
    [LineOrder]         NUMERIC (38, 8)  NULL,
    [Spread2]           NVARCHAR (254)   NULL,
    [SHAPE_STAr]        NUMERIC (38, 8)  NULL,
    [SHAPE_STLe]        NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [GlobalID]          NVARCHAR (38)    NULL,
    [ATWSImpact]        NUMERIC (38, 8)  NULL,
    [TWSImpact]         NUMERIC (38, 8)  NULL,
    [PE_Impact]         NUMERIC (38, 8)  NULL,
    [CL_Impact]         NUMERIC (38, 8)  NULL,
    [Shape_Le_2]        NUMERIC (38, 8)  NULL,
    [Total_Wksp]        NUMERIC (38, 8)  NULL,
    [Visibility]        SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R139_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g120_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S120_idx]
    ON [dbo].[CAD_FCL02_TRACTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10268532.7374561, XMIN = -10398347.9192384, YMAX = 3586315.77161998, YMIN = 3514964.53751346),
            CELLS_PER_OBJECT = 16
          );

