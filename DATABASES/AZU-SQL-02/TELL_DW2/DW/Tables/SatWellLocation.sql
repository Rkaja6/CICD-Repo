﻿CREATE TABLE [DW].[SatWellLocation] (
    [RecordSource]                           VARCHAR (17)    NOT NULL,
    [LoadDate]                               DATETIME2 (7)   NOT NULL,
    [LoadEndDate]                            DATETIME2 (7)   NULL,
    [SURFACE_LONGITUDE]                      DECIMAL (13, 9) NULL,
    [SURFACE_LATITUDE]                       DECIMAL (13, 9) NULL,
    [BH_LONGITUDE]                           DECIMAL (13, 9) NULL,
    [BH_LATITUDE]                            DECIMAL (13, 9) NULL,
    [Surface_TOWNSHIP_DIRECTION]             VARCHAR (12)    NULL,
    [Surface_TOWNSHIP_NUMBER]                DECIMAL (6, 1)  NULL,
    [Surface_RANGE_DIRECTION]                VARCHAR (12)    NULL,
    [Surface_RANGE_NUMBER]                   DECIMAL (5, 1)  NULL,
    [Surface_SECTION_NUMBER]                 VARCHAR (20)    NULL,
    [Surface_SECTION_TYPE]                   VARCHAR (12)    NULL,
    [Surface_SPOT]                           VARCHAR (12)    NULL,
    [Surface_MERIDIAN_NAME]                  VARCHAR (20)    NULL,
    [Surface_REMARK]                         VARCHAR (240)   NULL,
    [Surface_FOOTAGE_NORTH_SOUTH]            DECIMAL (7, 2)  NULL,
    [Surface_FOOTAGE_NORTH_SOUTH_START_LINE] VARCHAR (12)    NULL,
    [Surface_FOOTAGE_EAST_WEST]              DECIMAL (7, 2)  NULL,
    [Surface_FOOTAGE_EAST_WEST_START_LINE]   VARCHAR (12)    NULL,
    [Surface_FOOTAGE_REFERENCE_NAME]         VARCHAR (60)    NULL,
    [BH_TOWNSHIP_DIRECTION]                  VARCHAR (12)    NULL,
    [BH_TOWNSHIP_NUMBER]                     DECIMAL (6, 1)  NULL,
    [BH_RANGE_DIRECTION]                     VARCHAR (12)    NULL,
    [BH_RANGE_NUMBER]                        DECIMAL (5, 1)  NULL,
    [BH_SECTION_NUMBER]                      DECIMAL (5, 1)  NULL,
    [BH_SECTION_TYPE]                        VARCHAR (12)    NULL,
    [BH_SPOT]                                VARCHAR (12)    NULL,
    [BH_MERIDIAN_NAME]                       VARCHAR (20)    NULL,
    [BH_REMARK]                              VARCHAR (240)   NULL,
    [BH_FOOTAGE_NORTH_SOUTH]                 DECIMAL (7, 2)  NULL,
    [BH_FOOTAGE_NORTH_SOUTH_START_LINE]      VARCHAR (12)    NULL,
    [BH_FOOTAGE_EAST_WEST]                   DECIMAL (7, 2)  NULL,
    [BH_FOOTAGE_EAST_WEST_START_LINE]        VARCHAR (12)    NULL,
    [BH_FOOTAGE_REFERENCE_NAME]              VARCHAR (60)    NULL,
    [WellHashKey]                            BINARY (32)     NOT NULL,
    CONSTRAINT [PK_SatWellLocation] PRIMARY KEY CLUSTERED ([WellHashKey] ASC, [RecordSource] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);
