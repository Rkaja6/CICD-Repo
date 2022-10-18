﻿CREATE TABLE [dbo].[STD_AP_INV_TRANS_TPS] (
    [STD_AP_INV_TRANS_TPS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [TRANS_INDEX]             VARCHAR (9)   NULL,
    [TRANS_TYPES]             VARCHAR (5)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STD_AP_INV_TRANS_TPS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_AP_INV_TRANS_TPS_u2_id_in]
    ON [dbo].[STD_AP_INV_TRANS_TPS]([u2_id] ASC);

