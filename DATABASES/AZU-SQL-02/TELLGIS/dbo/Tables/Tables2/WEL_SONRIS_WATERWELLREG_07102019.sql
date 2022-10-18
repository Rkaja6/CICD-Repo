﻿CREATE TABLE [dbo].[WEL_SONRIS_WATERWELLREG_07102019] (
    [OBJECTID]                    INT              NOT NULL,
    [AQUIFER_NAME]                NVARCHAR (100)   NULL,
    [AUTHORIZED_SIGNATURE]        NVARCHAR (30)    NULL,
    [AUTHORIZED_SIGNATURE_DATE]   DATETIME2 (7)    NULL,
    [AVAILABLE_INFO]              NVARCHAR (200)   NULL,
    [AVAIL_INFO_W_LEVEL]          NVARCHAR (1)     NULL,
    [BIO_ANALYSIS]                NVARCHAR (1)     NULL,
    [CASING_DIAMETER2]            NVARCHAR (8)     NULL,
    [CASING_DIAMETER3]            NVARCHAR (8)     NULL,
    [CASING_DIAMETER]             NVARCHAR (8)     NULL,
    [CASING_LENGTH]               NVARCHAR (5)     NULL,
    [CASING_MATERIAL]             NVARCHAR (15)    NULL,
    [CEMENTED_FROM]               NVARCHAR (6)     NULL,
    [CHEM_ANALYSIS]               NVARCHAR (1)     NULL,
    [COMMENTS]                    NVARCHAR (150)   NULL,
    [CONTACT]                     NVARCHAR (30)    NULL,
    [DATE_COMPLETED]              NVARCHAR (12)    NULL,
    [DATE_MEASURED]               NVARCHAR (12)    NULL,
    [DATE_OF_ADD_UPDATE]          NVARCHAR (12)    NULL,
    [DATE_PLUGGED]                NVARCHAR (12)    NULL,
    [DATE_REGISTERED]             NVARCHAR (12)    NULL,
    [DIAMETER_OF_HOLE]            NVARCHAR (6)     NULL,
    [DRAWDOWN]                    NVARCHAR (6)     NULL,
    [DRILLERS_NAME]               NVARCHAR (45)    NULL,
    [DRILLERS_NUM]                NVARCHAR (7)     NULL,
    [DRILL_LOG]                   NVARCHAR (1)     NULL,
    [ELEC_LOG]                    NVARCHAR (1)     NULL,
    [ELEVATION]                   NVARCHAR (4)     NULL,
    [EXTENSION_PIPE]              NVARCHAR (6)     NULL,
    [EXTENSION_PIPE_FROM]         NVARCHAR (6)     NULL,
    [EXTENSION_PIPE_TO]           NVARCHAR (6)     NULL,
    [GEOLOGIC_UNIT]               NVARCHAR (8)     NULL,
    [GRAVEL_PACKED]               NVARCHAR (1)     NULL,
    [GROUND_EVELATION]            NVARCHAR (5)     NULL,
    [HEAT_PUMP_DEPTH]             NVARCHAR (6)     NULL,
    [HEAT_PUMP_HOLES]             INT              NULL,
    [HOLE_DEPTH]                  NVARCHAR (6)     NULL,
    [IDENTIFICATION_NUM]          NVARCHAR (15)    NULL,
    [INDUSTRIAL]                  NVARCHAR (5)     NULL,
    [INDUSTRIAL_OTHER]            NVARCHAR (30)    NULL,
    [INSPECTION_DATE]             DATETIME2 (7)    NULL,
    [INSPECTOR]                   NVARCHAR (50)    NULL,
    [INSPECTOR_REMARKS]           NVARCHAR (4000)  NULL,
    [LATITUDE]                    NVARCHAR (6)     NULL,
    [LATITUDE_DEGREES]            SMALLINT         NULL,
    [LATITUDE_MINUTES]            SMALLINT         NULL,
    [LATITUDE_SECONDS]            NUMERIC (38, 8)  NULL,
    [LOCAL_WELL_NUM]              NVARCHAR (6)     NOT NULL,
    [LOCATION_CITY]               NVARCHAR (30)    NULL,
    [LOCATION_LANDMARK]           NVARCHAR (200)   NULL,
    [LOCATION_MILES]              NUMERIC (38, 8)  NULL,
    [LONGITUDE]                   NVARCHAR (6)     NULL,
    [LONGITUDE_DEGREES]           SMALLINT         NULL,
    [LONGITUDE_MINUTES]           SMALLINT         NULL,
    [LONGITUDE_SECONDS]           NVARCHAR (240)   NULL,
    [MECHANIC_ANALYSIS]           NVARCHAR (1)     NULL,
    [OWNERS_NAME]                 NVARCHAR (65)    NULL,
    [OWNERS_NUMBER]               NVARCHAR (30)    NULL,
    [OWNER_STATE_REGS]            NVARCHAR (5)     NULL,
    [PARISH_CODE]                 NVARCHAR (5)     NULL,
    [PARISH_NAME]                 NVARCHAR (50)    NULL,
    [PARISH_NUM]                  NVARCHAR (3)     NULL,
    [PA_DETAILS]                  NVARCHAR (4000)  NULL,
    [PA_REMARKS]                  NVARCHAR (4000)  NULL,
    [PA_SIGNATURE]                NVARCHAR (30)    NULL,
    [PA_SIGNATURE_DATE]           DATETIME2 (7)    NULL,
    [PLUGGED_BY]                  NVARCHAR (15)    NULL,
    [PLUGGED_BY_NUM]              NVARCHAR (3)     NULL,
    [PUBLIC_SUPPLY]               NVARCHAR (5)     NULL,
    [PUBLIC_SUPPLY_OTHER]         NVARCHAR (30)    NULL,
    [PUMPDOWN_CASING]             NVARCHAR (1)     NULL,
    [PUMP_DETERMINED]             NVARCHAR (30)    NULL,
    [PUMP_DOWN_GRAVITY_METHOD]    NVARCHAR (1)     NULL,
    [PUMP_GROUND_SURFACE]         NVARCHAR (1)     NULL,
    [PUMP_HOURS]                  SMALLINT         NULL,
    [PUMP_HOURS_DATE]             DATETIME2 (7)    NULL,
    [PUMP_MOTOR_HP]               NVARCHAR (5)     NULL,
    [PUMP_PLANNED_DAYS]           SMALLINT         NULL,
    [PUMP_PLANNED_HOURS]          SMALLINT         NULL,
    [PUMP_PLANNED_RATE]           NVARCHAR (6)     NULL,
    [PUMP_RATE]                   NVARCHAR (20)    NULL,
    [PUMP_SETTING]                NVARCHAR (6)     NULL,
    [PUMP_STATIC_WATER_LEVEL]     NVARCHAR (6)     NULL,
    [PUMP_TEST]                   NVARCHAR (1)     NULL,
    [PUMP_TEST_DATE]              DATETIME2 (7)    NULL,
    [QUAD_NUM]                    NVARCHAR (4)     NULL,
    [RANGE]                       NVARCHAR (3)     NULL,
    [REMARKS]                     NVARCHAR (2000)  NULL,
    [REPLACEMENT_WELL]            NVARCHAR (5)     NULL,
    [REVISED_LATITUDE]            NVARCHAR (6)     NULL,
    [REVISED_LONGITUDE]           NVARCHAR (6)     NULL,
    [SCREEN_DIAMETER2]            NVARCHAR (8)     NULL,
    [SCREEN_DIAMETER3]            NVARCHAR (8)     NULL,
    [SCREEN_DIAMETER]             NVARCHAR (8)     NULL,
    [SCREEN_INTERVAL]             NVARCHAR (9)     NULL,
    [SCREEN_TYPE]                 NVARCHAR (15)    NULL,
    [SECTION]                     NVARCHAR (3)     NULL,
    [SEQUENCE_NUM]                NVARCHAR (2)     NULL,
    [SERIAL_NUMBER]               NVARCHAR (8)     NULL,
    [SITE_ADDRESS]                NVARCHAR (65)    NULL,
    [SITE_CITY]                   NVARCHAR (30)    NULL,
    [SITE_ZIP]                    NVARCHAR (10)    NULL,
    [SLOT_LENGTH]                 NVARCHAR (5)     NULL,
    [SLOT_SIZE]                   NVARCHAR (6)     NULL,
    [SOURCE_OF_MEASURE]           NVARCHAR (1)     NULL,
    [STATE_CODE]                  NVARCHAR (17)    NULL,
    [TOWNSHIP]                    NVARCHAR (3)     NULL,
    [USE_DESCRIPTION]             NVARCHAR (100)   NULL,
    [WATER_LEVEL]                 NVARCHAR (14)    NULL,
    [WATER_WELL_NUM]              NVARCHAR (10)    NULL,
    [WATER_WELL_REGISTRATION_SEQ] INT              NOT NULL,
    [WELL_DEPTH]                  NVARCHAR (4)     NULL,
    [WELL_STATUS]                 NVARCHAR (50)    NULL,
    [WELL_SUBUSE]                 NVARCHAR (12)    NULL,
    [WELL_USE]                    NVARCHAR (1)     NULL,
    [WWO_SEQ_NUM]                 NUMERIC (38, 8)  NULL,
    [X_LONGDD]                    NUMERIC (38, 8)  NULL,
    [YIELD]                       NVARCHAR (4)     NULL,
    [YIELD_MEASURED]              NVARCHAR (30)    NULL,
    [Y_LATDD]                     NUMERIC (38, 8)  NULL,
    [Shape]                       [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]           VARBINARY (MAX)  NULL,
    CONSTRAINT [R414_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g377_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S377_idx]
    ON [dbo].[WEL_SONRIS_WATERWELLREG_07102019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 44589491.0995895, XMIN = -21940647.20886, YMAX = 33265069.1542248, YMIN = -33265069.1542248),
            CELLS_PER_OBJECT = 16
          );

