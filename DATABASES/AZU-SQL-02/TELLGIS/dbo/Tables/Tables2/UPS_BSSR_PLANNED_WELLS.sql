CREATE TABLE [dbo].[UPS_BSSR_PLANNED_WELLS] (
    [OBJECTID_12]       INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Xsec]              NVARCHAR (5)     NULL,
    [GISNO]             INT              NULL,
    [SHL_Sec]           NVARCHAR (5)     NULL,
    [BHL_Sec]           NVARCHAR (5)     NULL,
    [CUWI]              NUMERIC (38, 8)  NULL,
    [CUNRI]             NUMERIC (38, 8)  NULL,
    [SHLTwpRng]         NVARCHAR (20)    NULL,
    [BHLTwpRng]         NVARCHAR (10)    NULL,
    [Co_Par]            NVARCHAR (50)    NULL,
    [RSV_Cat]           NVARCHAR (10)    NULL,
    [PROPNUM]           NVARCHAR (50)    NULL,
    [LEASE]             NVARCHAR (254)   NULL,
    [WELL_NO]           NVARCHAR (254)   NULL,
    [Notes]             NVARCHAR (50)    NULL,
    [Operated]          NVARCHAR (25)    NULL,
    [Well_Statu]        NVARCHAR (50)    NULL,
    [SHL_Lat]           NUMERIC (38, 8)  NULL,
    [SHL_Long]          NUMERIC (38, 8)  NULL,
    [BHL_Lat]           NUMERIC (38, 8)  NULL,
    [BHL_Long]          NUMERIC (38, 8)  NULL,
    [TC_Name]           NVARCHAR (25)    NULL,
    [TC_Val]            NUMERIC (38, 8)  NULL,
    [RSVCT_YE20]        NVARCHAR (50)    NULL,
    [RSV_CHANGE]        NVARCHAR (50)    NULL,
    [GISNOFORM]         NVARCHAR (10)    NULL,
    [Deletes]           NVARCHAR (5)     NULL,
    [Drill_Orde]        NUMERIC (38, 8)  NULL,
    [Pad_Wells]         NUMERIC (38, 8)  NULL,
    [Well_Numbe]        NUMERIC (38, 8)  NULL,
    [PAD]               NVARCHAR (254)   NULL,
    [Formation]         NVARCHAR (254)   NULL,
    [Budget]            NVARCHAR (10)    NULL,
    [SpudDate]          NVARCHAR (25)    NULL,
    [Category]          NVARCHAR (50)    NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [DrillOrder]        NVARCHAR (5)     NULL,
    [datex]             DATETIME2 (7)    NULL,
    [ARIES_FPD]         DATETIME2 (7)    NULL,
    [GIS_Number]        NVARCHAR (50)    NULL,
    [CLAT]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R620_pk] PRIMARY KEY CLUSTERED ([OBJECTID_12] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g583_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S583_idx]
    ON [dbo].[UPS_BSSR_PLANNED_WELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10398279.2707277, XMIN = -10404730.4034946, YMAX = 3763855.99922287, YMIN = 3745016.07700993),
            CELLS_PER_OBJECT = 16
          );

