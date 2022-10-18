﻿CREATE TABLE [dbo].[WEL_DUCS_SHL] (
    [OBJECTID]                        INT              NOT NULL,
    [UWI]                             NVARCHAR (20)    NOT NULL,
    [SOURCE]                          NVARCHAR (12)    NOT NULL,
    [ACTIVITY_CODE]                   NVARCHAR (12)    NULL,
    [API_NUMBER]                      NVARCHAR (20)    NULL,
    [BASIN]                           NVARCHAR (60)    NULL,
    [BH_LATITUDE]                     NUMERIC (38, 8)  NULL,
    [BH_LL_SOURCE]                    NVARCHAR (12)    NULL,
    [BH_LONGITUDE]                    NUMERIC (38, 8)  NULL,
    [CLASS_FINAL_CODE]                NVARCHAR (12)    NULL,
    [CLASS_FINAL_NAME]                NVARCHAR (60)    NULL,
    [CLASS_INITIAL_CODE]              NVARCHAR (12)    NULL,
    [CLASS_INITIAL_NAME]              NVARCHAR (60)    NULL,
    [COUNTRY_NAME]                    NVARCHAR (60)    NULL,
    [COUNTY_NAME]                     NVARCHAR (12)    NULL,
    [CURRENT_OPERATOR_CITY]           NVARCHAR (120)   NULL,
    [CURRENT_OPERATOR_NAME]           NVARCHAR (60)    NULL,
    [CURRENT_STATUS]                  NVARCHAR (12)    NULL,
    [DATE_COMPLETION]                 DATETIME2 (7)    NULL,
    [DATE_FIRST_REPORT]               DATETIME2 (7)    NULL,
    [DATE_FIRST_SPUD]                 DATETIME2 (7)    NULL,
    [DATE_LAST_ACTIVITY]              DATETIME2 (7)    NULL,
    [DATE_RIG_RELEASE]                DATETIME2 (7)    NULL,
    [DATE_SPUD]                       DATETIME2 (7)    NULL,
    [DEPTH_TOTAL_DRILLER]             NUMERIC (38, 8)  NULL,
    [DEPTH_TOTAL_LOGGER]              NUMERIC (38, 8)  NULL,
    [DEPTH_TOTAL_PROJECTED]           NUMERIC (38, 8)  NULL,
    [DEPTH_TRUE_VERTICAL]             NUMERIC (38, 8)  NULL,
    [DEPTH_WATER_DATUM]               NVARCHAR (12)    NULL,
    [DEPTH_WATER_VALUE]               NUMERIC (38, 8)  NULL,
    [DEPTH_WHIPSTOCK]                 NUMERIC (38, 8)  NULL,
    [ELEVATION_REFERENCE_DATUM]       NVARCHAR (12)    NULL,
    [ELEVATION_REFERENCE_VALUE]       NUMERIC (38, 8)  NULL,
    [FIELD_NAME]                      NVARCHAR (30)    NULL,
    [FORMATION_AT_TD_NAME]            NVARCHAR (60)    NULL,
    [FORMATION_PRODUCING_NAME]        NVARCHAR (60)    NULL,
    [FORMATION_PROJECTED_NAME]        NVARCHAR (60)    NULL,
    [GROUND_ELEVATION]                NUMERIC (38, 8)  NULL,
    [HOLE_DIRECTION]                  NVARCHAR (12)    NULL,
    [IC_NUMBER]                       NVARCHAR (20)    NULL,
    [LEASE_NAME]                      NVARCHAR (60)    NULL,
    [MAP_SYMBOL]                      NVARCHAR (60)    NULL,
    [OPERATOR_CITY]                   NVARCHAR (120)   NULL,
    [OPERATOR_NAME]                   NVARCHAR (60)    NULL,
    [OS_INDICATOR]                    NVARCHAR (12)    NULL,
    [PERMIT_DATE]                     DATETIME2 (7)    NULL,
    [PERMIT_FILER_LONG]               NVARCHAR (240)   NULL,
    [PERMIT_NUMBER]                   NVARCHAR (9)     NULL,
    [PERMIT_PHONE]                    NVARCHAR (30)    NULL,
    [PLAY_NAME]                       NVARCHAR (60)    NULL,
    [PLAY_TYPE]                       NVARCHAR (30)    NULL,
    [PRODFIT_80_DEGREE_HEEL_PT_FORM]  NVARCHAR (60)    NULL,
    [PRODFIT_FORMATION_AT_TD_NAME]    NVARCHAR (60)    NULL,
    [PRODFIT_TOP_PRODUCING_FORMATION] NVARCHAR (60)    NULL,
    [PROPOSED_BH_LATITUDE]            NUMERIC (38, 8)  NULL,
    [PROPOSED_BH_LL_SOURCE]           NVARCHAR (12)    NULL,
    [PROPOSED_BH_LONGITUDE]           NUMERIC (38, 8)  NULL,
    [REGULATORY_API]                  NVARCHAR (20)    NULL,
    [REGULATORY_STATUS]               NVARCHAR (20)    NULL,
    [REGULATORY_STATUS_DATE]          DATETIME2 (7)    NULL,
    [STATE_NAME]                      NVARCHAR (60)    NULL,
    [STATUS_FINAL_CODE]               NVARCHAR (12)    NULL,
    [SURFACE_LATITUDE]                NUMERIC (38, 8)  NULL,
    [SURFACE_LL_SOURCE]               NVARCHAR (12)    NULL,
    [SURFACE_LONGITUDE]               NUMERIC (38, 8)  NULL,
    [WELL_NUMBER]                     NVARCHAR (20)    NULL,
    [WELL_STATUS]                     NVARCHAR (12)    NULL,
    [OBJECTID_1]                      INT              NULL,
    [API]                             NUMERIC (38, 8)  NULL,
    [APIx]                            NVARCHAR (50)    NULL,
    [Shape]                           [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]               VARBINARY (MAX)  NULL,
    CONSTRAINT [R436_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g399_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S399_idx]
    ON [dbo].[WEL_DUCS_SHL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10392876.4217639, XMIN = -10393408.7383919, YMAX = 3778843.25815359, YMIN = 3776750.83533177),
            CELLS_PER_OBJECT = 16
          );

