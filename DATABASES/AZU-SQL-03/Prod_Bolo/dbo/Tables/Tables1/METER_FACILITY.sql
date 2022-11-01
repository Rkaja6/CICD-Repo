﻿CREATE TABLE [dbo].[METER_FACILITY] (
    [METER_FACILITY_ID]      VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [PROD_FAC_PRD_EFF_DATES] DATETIME      NULL,
    [PROD_FAC_PRD_EXP_DATES] DATETIME      NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([METER_FACILITY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [METER_FACILITY_u2_id_in]
    ON [dbo].[METER_FACILITY]([u2_id] ASC);
