CREATE TABLE [dbo].[UPS_Q12022_BSSR_DEVWELLS_RBORE] (
    [OBJECTID]          INT              NOT NULL,
    [GISNO]             INT              NULL,
    [SHL_Sec]           NVARCHAR (5)     NULL,
    [BHL_Sec]           NVARCHAR (5)     NULL,
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
    [GISNOFORM]         NVARCHAR (10)    NULL,
    [Deletes]           NVARCHAR (5)     NULL,
    [CUWI]              NUMERIC (38, 8)  NULL,
    [CUNRI]             NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [CLAT]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R636_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g599_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S599_idx]
    ON [dbo].[UPS_Q12022_BSSR_DEVWELLS_RBORE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10375687.7235435, XMIN = -10435661.7611513, YMAX = 3788457.1186584, YMIN = 3724075.23201893),
            CELLS_PER_OBJECT = 16
          );

