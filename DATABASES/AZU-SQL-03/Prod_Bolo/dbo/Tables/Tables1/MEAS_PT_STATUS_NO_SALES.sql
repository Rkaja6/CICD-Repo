﻿CREATE TABLE [dbo].[MEAS_PT_STATUS_NO_SALES] (
    [MEAS_PT_STATUS_NO_SALES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [NO_SALES_WELL_PROD_INDEX]   VARCHAR (9)   NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MEAS_PT_STATUS_NO_SALES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_S_u2_id_45417]
    ON [dbo].[MEAS_PT_STATUS_NO_SALES]([u2_id] ASC);

