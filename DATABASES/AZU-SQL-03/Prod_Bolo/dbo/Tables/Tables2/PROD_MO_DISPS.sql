﻿CREATE TABLE [dbo].[PROD_MO_DISPS] (
    [PROD_MO_DISPS_ID]               VARCHAR (255)   NOT NULL,
    [u2_id]                          VARCHAR (255)   NULL,
    [ALLOC_DISP_BTU_FACTORS]         NUMERIC (19, 4) NULL,
    [ALLOC_DISP_COMMENTS]            VARCHAR (20)    NULL,
    [ALLOC_DISP_GROSS_VOLS]          NUMERIC (19, 2) NULL,
    [ALLOC_DISP_MMBTUS]              NUMERIC (19, 2) NULL,
    [ALLOC_DISP_STD_VOLS]            NUMERIC (19, 2) NULL,
    [ALLOC_DISP_VOLS]                NUMERIC (19, 2) NULL,
    [AVG_TEMPS]                      NUMERIC (9, 1)  NULL,
    [BEGIN_METER_VOLS]               NUMERIC (19, 2) NULL,
    [BSW_FACTORS]                    NUMERIC (19, 3) NULL,
    [CHART_OFF]                      DATETIME        NULL,
    [CLOSING_METER_VOLS]             NUMERIC (19, 2) NULL,
    [COEFFICIENTS]                   NUMERIC (19, 4) NULL,
    [COMPRESSOR_BTU_FACTORS]         NUMERIC (19, 4) NULL,
    [COMPRESSOR_MMBTUS]              NUMERIC (19, 2) NULL,
    [COMPRESSOR_VOLS]                NUMERIC (19, 2) NULL,
    [CORRECTED_GRAVITY]              NUMERIC (9, 1)  NULL,
    [DIFFERENTIALS]                  NUMERIC (19, 2) NULL,
    [DISCHARGE_PRESSURES]            NUMERIC (9)     NULL,
    [DISPS]                          VARCHAR (5)     NULL,
    [DISP_BTU_FACTORS]               NUMERIC (19, 4) NULL,
    [DISP_COMMENTS]                  VARCHAR (30)    NULL,
    [DISP_GROSS_VOLS]                NUMERIC (19, 2) NULL,
    [DISP_MMBTUS]                    NUMERIC (19, 2) NULL,
    [DISP_SOURCE_DOCS]               VARCHAR (43)    NULL,
    [DISP_SOURCE_NODE_IDS]           VARCHAR (10)    NULL,
    [DISP_STD_VOLS]                  NUMERIC (19, 2) NULL,
    [DISP_VOLS]                      NUMERIC (19, 2) NULL,
    [EQUIP_DOWN_END_OF_DAY]          VARCHAR (5)     NULL,
    [EQUIP_DOWN_HOURS]               NUMERIC (19, 2) NULL,
    [EQUIP_DOWN_MINUTES]             NUMERIC (9)     NULL,
    [EQUIP_DOWN_REASON]              VARCHAR (6)     NULL,
    [EQUIP_IDS]                      VARCHAR (16)    NULL,
    [EQUIP_REMARKS]                  VARCHAR (30)    NULL,
    [EQUIP_TYPES]                    VARCHAR (5)     NULL,
    [FLOWING_HOURS]                  NUMERIC (9)     NULL,
    [FLOWING_MINUTES]                NUMERIC (9)     NULL,
    [FLOWING_TEMPS]                  NUMERIC (9, 1)  NULL,
    [GAS_BTU_FACTORS]                NUMERIC (19, 4) NULL,
    [GAS_MMBTUS]                     NUMERIC (19, 2) NULL,
    [GAS_VOLS]                       NUMERIC (19, 2) NULL,
    [GROSS_METER_VOLS]               NUMERIC (19, 2) NULL,
    [METER_FACTORS]                  NUMERIC (19, 8) NULL,
    [METER_RESET_FLAGS]              VARCHAR (5)     NULL,
    [METER_TICKETS]                  VARCHAR (6)     NULL,
    [OBSERVED_GRAVITY]               NUMERIC (9, 1)  NULL,
    [OBSERVED_TEMPS]                 NUMERIC (9, 1)  NULL,
    [OIL_METER_NET_OIL_VOLS]         NUMERIC (19, 2) NULL,
    [OIL_METER_WATER_VOLS]           VARCHAR (9)     NULL,
    [PLATE_SIZES]                    NUMERIC (19, 2) NULL,
    [REDIRECT_PROD_MO_IDS]           VARCHAR (10)    NULL,
    [RPMS]                           NUMERIC (9)     NULL,
    [STATIC_PRESSURES]               NUMERIC (19, 2) NULL,
    [SUCTION_PRESSURES]              NUMERIC (9)     NULL,
    [TEMP_ALLOC_VOL]                 NUMERIC (19, 2) NULL,
    [TEMP_CORRECTION_FACTORS]        NUMERIC (19, 4) NULL,
    [WATER_METER_BEGIN_METER_VOLS]   NUMERIC (19, 2) NULL,
    [WATER_METER_CLOSING_METER_VOLS] NUMERIC (19, 2) NULL,
    [WATER_METER_GROSS_METER_VOLS]   NUMERIC (19, 2) NULL,
    [WATER_METER_METER_FACTORS]      NUMERIC (19, 2) NULL,
    [WATER_METER_METER_RESET_FLAGS]  VARCHAR (5)     NULL,
    [WATER_PRESSURE]                 NUMERIC (9)     NULL,
    [WATER_VOLS]                     NUMERIC (19, 2) NULL,
    [time_stamp]                     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_MO_DISPS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_MO_DISPS_u2_id_in]
    ON [dbo].[PROD_MO_DISPS]([u2_id] ASC);
