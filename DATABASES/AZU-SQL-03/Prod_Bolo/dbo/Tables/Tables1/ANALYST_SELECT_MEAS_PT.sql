﻿CREATE TABLE [dbo].[ANALYST_SELECT_MEAS_PT] (
    [ANALYST_SELECT_MEAS_PT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [MEAS_PT]                   VARCHAR (10)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ANALYST_SELECT_MEAS_PT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ANALYST_S_u2_id_53628]
    ON [dbo].[ANALYST_SELECT_MEAS_PT]([u2_id] ASC);

