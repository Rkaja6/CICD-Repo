﻿CREATE TABLE [dbo].[RR_SYS_FED_RPT] (
    [RR_SYS_FED_RPT_ID]     VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [FED_RPTG_NOS]          VARCHAR (15)  NULL,
    [FED_RPTG_NO_EFF_DATES] DATETIME      NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_FED_RPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_FED_RPT_u2_id_in]
    ON [dbo].[RR_SYS_FED_RPT]([u2_id] ASC);

