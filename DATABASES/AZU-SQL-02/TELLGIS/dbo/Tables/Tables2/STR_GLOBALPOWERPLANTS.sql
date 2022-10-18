CREATE TABLE [dbo].[STR_GLOBALPOWERPLANTS] (
    [OBJECTID]                 INT              NOT NULL,
    [country]                  NVARCHAR (255)   NULL,
    [country_long]             NVARCHAR (255)   NULL,
    [name]                     NVARCHAR (255)   NULL,
    [gppd_idnr]                NVARCHAR (255)   NULL,
    [capacity_mw]              NUMERIC (38, 8)  NULL,
    [latitude]                 NUMERIC (38, 8)  NULL,
    [longitude]                NUMERIC (38, 8)  NULL,
    [fuel1]                    NVARCHAR (255)   NULL,
    [fuel2]                    NVARCHAR (255)   NULL,
    [fuel3]                    NVARCHAR (255)   NULL,
    [fuel4]                    NVARCHAR (255)   NULL,
    [commissioning_year]       NUMERIC (38, 8)  NULL,
    [owner]                    NVARCHAR (255)   NULL,
    [source]                   NVARCHAR (255)   NULL,
    [url]                      NVARCHAR (255)   NULL,
    [geolocation_source]       NVARCHAR (255)   NULL,
    [year_of_capacity_data]    NUMERIC (38, 8)  NULL,
    [generation_gwh_2013]      NVARCHAR (255)   NULL,
    [generation_gwh_2014]      NVARCHAR (255)   NULL,
    [generation_gwh_2015]      NVARCHAR (255)   NULL,
    [generation_gwh_2016]      NVARCHAR (255)   NULL,
    [estimated_generation_gwh] NUMERIC (38, 8)  NULL,
    [Shape]                    [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]        VARBINARY (MAX)  NULL,
    CONSTRAINT [R294_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g275_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S275_idx]
    ON [dbo].[STR_GLOBALPOWERPLANTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19756975.4895133, XMIN = -19115299.4334313, YMAX = 11502750.960016, YMIN = -14286419.3740414),
            CELLS_PER_OBJECT = 16
          );

