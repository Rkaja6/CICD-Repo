﻿CREATE TABLE [dbo].[MEAS_PT_EFF_DT] (
    [MEAS_PT_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [EFF_DATES]         DATETIME      NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MEAS_PT_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_EFF_DT_u2_id_in]
    ON [dbo].[MEAS_PT_EFF_DT]([u2_id] ASC);

