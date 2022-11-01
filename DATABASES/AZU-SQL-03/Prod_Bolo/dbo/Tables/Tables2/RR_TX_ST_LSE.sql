﻿CREATE TABLE [dbo].[RR_TX_ST_LSE] (
    [RR_TX_ST_LSE_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [LSE_EFF_DATES]   DATETIME      NULL,
    [LSE_EXP_DATES]   DATETIME      NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_TX_ST_LSE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_TX_ST_LSE_u2_id_in]
    ON [dbo].[RR_TX_ST_LSE]([u2_id] ASC);
