CREATE TABLE [dbo].[UPS_Q32022_HSVL_DEVWELLS_RBORE] (
    [OBJECTID]          INT              NOT NULL,
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
    [Deletes]           NVARCHAR (5)     NULL,
    [GISNOFORM]         NVARCHAR (10)    NULL,
    [CUWI]              NUMERIC (38, 8)  NULL,
    [CUNRI]             NUMERIC (38, 8)  NULL,
    [CLAT]              NUMERIC (38, 8)  NULL,
    [Organic_Wells]     NVARCHAR (5)     NULL,
    [TEMPID]            INT              NULL,
    [SUM_CUWI]          NUMERIC (38, 8)  NULL,
    [SUM_CUNRI]         NUMERIC (38, 8)  NULL,
    [TC_Name]           NVARCHAR (50)    NULL,
    [TC_Value]          NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R693_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g656_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S656_idx]
    ON [dbo].[UPS_Q32022_HSVL_DEVWELLS_RBORE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10375510.2098217, XMIN = -10468674.008562, YMAX = 3786538.96948315, YMIN = 3724037.65856829)
          );

