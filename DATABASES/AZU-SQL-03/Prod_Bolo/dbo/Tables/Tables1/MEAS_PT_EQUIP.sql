﻿CREATE TABLE [dbo].[MEAS_PT_EQUIP] (
    [MEAS_PT_EQUIP_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [EQUIP_EFF_DATE]   DATETIME      NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MEAS_PT_EQUIP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_EQUIP_u2_id_in]
    ON [dbo].[MEAS_PT_EQUIP]([u2_id] ASC);

