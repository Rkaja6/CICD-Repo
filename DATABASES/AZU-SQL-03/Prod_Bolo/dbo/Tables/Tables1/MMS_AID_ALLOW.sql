﻿CREATE TABLE [dbo].[MMS_AID_ALLOW] (
    [MMS_AID_ALLOW_ID] VARCHAR (255)   NOT NULL,
    [u2_id]            VARCHAR (255)   NULL,
    [ALLOW_AMTS]       NUMERIC (19, 2) NULL,
    [ALLOW_EFF_DATES]  DATETIME        NULL,
    [ALLOW_RATES]      NUMERIC (19, 4) NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MMS_AID_ALLOW_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_AID_ALLOW_u2_id_in]
    ON [dbo].[MMS_AID_ALLOW]([u2_id] ASC);

