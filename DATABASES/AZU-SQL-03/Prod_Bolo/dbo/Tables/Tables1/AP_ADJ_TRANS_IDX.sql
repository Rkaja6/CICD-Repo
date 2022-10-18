﻿CREATE TABLE [dbo].[AP_ADJ_TRANS_IDX] (
    [subValueId]            VARCHAR (255)  NOT NULL,
    [AP_ADJ_TRANS_INDEX_ID] VARCHAR (255)  NULL,
    [TRANS_INDEX]           VARCHAR (1247) NULL,
    [TRANS_TYPES]           VARCHAR (5)    NULL,
    [time_stamp]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_ADJ_TR_AP_ADJ_TR_48485]
    ON [dbo].[AP_ADJ_TRANS_IDX]([AP_ADJ_TRANS_INDEX_ID] ASC);

