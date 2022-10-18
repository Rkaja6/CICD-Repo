﻿CREATE TABLE [dbo].[MEAS_PT_VOL_SALE_MO] (
    [MEAS_PT_VOL_SALE_MO_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [PRODUCED_MCFS]          VARCHAR (10)  NULL,
    [PRODUCED_MMBTUS]        VARCHAR (10)  NULL,
    [SALE_MONTHS]            VARCHAR (10)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MEAS_PT_VOL_SALE_MO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_VOL_SALE_MO_u2_id_in]
    ON [dbo].[MEAS_PT_VOL_SALE_MO]([u2_id] ASC);

