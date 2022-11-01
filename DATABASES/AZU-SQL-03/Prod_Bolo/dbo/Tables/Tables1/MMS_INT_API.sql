﻿CREATE TABLE [dbo].[MMS_INT_API] (
    [MMS_INT_API_ID]  VARCHAR (255)   NOT NULL,
    [u2_id]           VARCHAR (255)   NULL,
    [EFF_DATES]       DATETIME        NULL,
    [EXP_DATES]       DATETIME        NULL,
    [OVER_FED_RATES]  NUMERIC (19, 4) NULL,
    [UNDER_FED_RATES] NUMERIC (19, 4) NULL,
    [UNDER_IND_RATES] NUMERIC (19, 4) NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MMS_INT_API_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_INT_API_u2_id_in]
    ON [dbo].[MMS_INT_API]([u2_id] ASC);
