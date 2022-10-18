CREATE TABLE [dbo].[UPS_Q12022_HSVL_DEVWELLS_RBORE] (
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
    [TC_Name]           NVARCHAR (10)    NULL,
    [TC_Val]            NUMERIC (38, 8)  NULL,
    [Deletes]           NVARCHAR (5)     NULL,
    [GISNOFORM]         NVARCHAR (10)    NULL,
    [CUWI]              NUMERIC (38, 8)  NULL,
    [CUNRI]             NUMERIC (38, 8)  NULL,
    [CLAT]              NUMERIC (38, 8)  NULL,
    [Organic_Wells]     NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R637_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g600_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S600_idx]
    ON [dbo].[UPS_Q12022_HSVL_DEVWELLS_RBORE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10373646.8937202, XMIN = -10468674.008562, YMAX = 3790628.61501906, YMIN = 3724037.65856829),
            CELLS_PER_OBJECT = 16
          );

