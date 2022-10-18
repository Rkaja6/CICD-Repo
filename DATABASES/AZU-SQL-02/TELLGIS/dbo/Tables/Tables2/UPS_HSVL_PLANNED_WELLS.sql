CREATE TABLE [dbo].[UPS_HSVL_PLANNED_WELLS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [GISNO]             INT              NULL,
    [SHL_Sec]           NVARCHAR (5)     NULL,
    [BHL_Sec]           NVARCHAR (5)     NULL,
    [SHLTwpRng]         NVARCHAR (20)    NULL,
    [BHLTwpRng]         NVARCHAR (10)    NULL,
    [Co_Par]            NVARCHAR (50)    NULL,
    [RSV_CAT]           NVARCHAR (254)   NULL,
    [PROPNUM]           NVARCHAR (254)   NULL,
    [LEASE]             NVARCHAR (254)   NULL,
    [WELL_NO]           NVARCHAR (254)   NULL,
    [notes]             NVARCHAR (254)   NULL,
    [Operated]          NVARCHAR (25)    NULL,
    [Well_Statu]        NVARCHAR (50)    NULL,
    [SHL_Lat]           NUMERIC (38, 8)  NULL,
    [SHL_Long]          NUMERIC (38, 8)  NULL,
    [BHL_Lat]           NUMERIC (38, 8)  NULL,
    [BHL_Long]          NUMERIC (38, 8)  NULL,
    [TC_Name]           NVARCHAR (10)    NULL,
    [TC_Val]            NUMERIC (38, 8)  NULL,
    [Deletes]           NVARCHAR (5)     NULL,
    [TPC_TC]            NVARCHAR (50)    NULL,
    [RSVCT_YE20]        NVARCHAR (50)    NULL,
    [NEW_LL]            NUMERIC (38, 8)  NULL,
    [WI_YE20]           NUMERIC (38, 8)  NULL,
    [NRI_YE20]          NUMERIC (38, 8)  NULL,
    [RSV_CHANGE]        NVARCHAR (50)    NULL,
    [GISNOFORM]         NVARCHAR (10)    NULL,
    [Pad_Wells]         NVARCHAR (5)     NULL,
    [Well_No_Pa]        NVARCHAR (5)     NULL,
    [Well_Numbe]        NUMERIC (38, 8)  NULL,
    [PAD]               NVARCHAR (254)   NULL,
    [GIS_Number]        NUMERIC (38, 8)  NULL,
    [Formation]         NVARCHAR (254)   NULL,
    [Budget]            NVARCHAR (10)    NULL,
    [SpudDate]          NVARCHAR (25)    NULL,
    [Category]          NVARCHAR (50)    NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [DrillOrder]        NVARCHAR (5)     NULL,
    [datex]             DATETIME2 (7)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R621_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g584_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S584_idx]
    ON [dbo].[UPS_HSVL_PLANNED_WELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389205.4357859, XMIN = -10405209.6725107, YMAX = 3786532.84682597, YMIN = 3745015.36248573),
            CELLS_PER_OBJECT = 16
          );

