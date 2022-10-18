CREATE TABLE [dbo].[LND_CAMERON_PARCELS] (
    [OBJECTID]          INT              NOT NULL,
    [FID_1]             NVARCHAR (254)   NULL,
    [CountyFips]        NVARCHAR (10)    NULL,
    [county_id]         NVARCHAR (60)    NULL,
    [ParcelId]          NVARCHAR (50)    NULL,
    [ParcelLgl]         NVARCHAR (254)   NULL,
    [SourceRef]         NVARCHAR (100)   NULL,
    [SourceDate]        DATETIME2 (7)    NULL,
    [OwnerName]         NVARCHAR (50)    NULL,
    [AdrNum]            INT              NULL,
    [PreDir]            NVARCHAR (2)     NULL,
    [PstrNam]           NVARCHAR (75)    NULL,
    [PstrType]          NVARCHAR (6)     NULL,
    [PsufDir]           NVARCHAR (2)     NULL,
    [AdrCity]           NVARCHAR (50)    NULL,
    [AdrZip5]           INT              NULL,
    [AdrLabel]          NVARCHAR (254)   NULL,
    [ParcelType]        NVARCHAR (2)     NULL,
    [AssesValue]        NUMERIC (38, 8)  NULL,
    [ImpValue]          NUMERIC (38, 8)  NULL,
    [LandValue]         NUMERIC (38, 8)  NULL,
    [TotalValue]        NUMERIC (38, 8)  NULL,
    [Subdivisio]        NVARCHAR (254)   NULL,
    [NBHD]              NVARCHAR (10)    NULL,
    [Section]           INT              NULL,
    [Township]          NVARCHAR (15)    NULL,
    [Range]             NVARCHAR (15)    NULL,
    [STR]               NVARCHAR (47)    NULL,
    [TaxCode]           NVARCHAR (10)    NULL,
    [TaxArea]           NUMERIC (38, 8)  NULL,
    [CAMAKey]           INT              NULL,
    [CAMAProv]          NVARCHAR (25)    NULL,
    [County]            NVARCHAR (25)    NULL,
    [DataProv]          NVARCHAR (16)    NULL,
    [CAMADate]          DATETIME2 (7)    NULL,
    [PubDate]           DATETIME2 (7)    NULL,
    [NatCooSys]         NVARCHAR (1)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R764_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g727_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S727_idx]
    ON [dbo].[LND_CAMERON_PARCELS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10309847.0507241, XMIN = -10453396.5684442, YMAX = 3510326.79737332, YMIN = 3449585.03040423)
          );

