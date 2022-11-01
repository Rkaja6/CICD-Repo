﻿CREATE TABLE [dbo].[RR_TX_OTHR_PTY] (
    [subValueId]          VARCHAR (255) NOT NULL,
    [RR_TX_OTHR_ID]       VARCHAR (255) NULL,
    [OTHER_PTY_CONTRACTS] VARCHAR (9)   NULL,
    [OTHER_PTY_NOS]       VARCHAR (9)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_TX_OTH_RR_TX_OTH_50299]
    ON [dbo].[RR_TX_OTHR_PTY]([RR_TX_OTHR_ID] ASC);
