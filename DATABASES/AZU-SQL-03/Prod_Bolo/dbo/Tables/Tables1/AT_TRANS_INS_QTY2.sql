﻿CREATE TABLE [dbo].[AT_TRANS_INS_QTY2] (
    [subValueId]      VARCHAR (255)   NOT NULL,
    [AT_TRANS_INS_ID] VARCHAR (255)   NULL,
    [INS_QTY2S]       NUMERIC (19, 2) NULL,
    [time_stamp]      DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_TRANS__AT_TRANS__28192]
    ON [dbo].[AT_TRANS_INS_QTY2]([AT_TRANS_INS_ID] ASC);

