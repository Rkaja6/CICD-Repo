﻿CREATE TABLE [dbo].[TANK_TABLE_MEAS] (
    [TANK_TABLE_MEAS_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [CONE_VOLUME]         NUMERIC (19, 5) NULL,
    [CUM_FRACTIONS]       NUMERIC (9)     NULL,
    [CUM_VOLUMES]         NUMERIC (19, 5) NULL,
    [FACTORS]             NUMERIC (19, 5) NULL,
    [FEET]                VARCHAR (5)     NULL,
    [FRACTIONAL_INCHES]   VARCHAR (10)    NULL,
    [INCHES]              VARCHAR (6)     NULL,
    [INCREMENTAL_VOLUMES] NUMERIC (19, 5) NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([TANK_TABLE_MEAS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TANK_TABLE_MEAS_u2_id_in]
    ON [dbo].[TANK_TABLE_MEAS]([u2_id] ASC);

