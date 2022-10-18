﻿CREATE TABLE [dbo].[AP_APPR_PROF_CC] (
    [AP_APPR_PROF_CC_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [COST_CENTERS]       VARCHAR (11)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AP_APPR_PROF_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_APPR_PROF_CC_u2_id_in]
    ON [dbo].[AP_APPR_PROF_CC]([u2_id] ASC);

