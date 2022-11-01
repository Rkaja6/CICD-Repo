﻿CREATE TABLE [dbo].[MEAS_PT_VOL_IDX] (
    [subValueId]         VARCHAR (255) NOT NULL,
    [MEAS_PT_SALE_MO_ID] VARCHAR (255) NULL,
    [CTRC_VOL_INDEX]     VARCHAR (16)  NULL,
    [MKT_VOL_INDEX]      VARCHAR (10)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_V_MEAS_PT_S_61851]
    ON [dbo].[MEAS_PT_VOL_IDX]([MEAS_PT_SALE_MO_ID] ASC);
