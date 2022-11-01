﻿CREATE TABLE [dbo].[RR_KS_LSE] (
    [subValueId]      VARCHAR (255) NOT NULL,
    [RR_KS_ST_LSE_ID] VARCHAR (255) NULL,
    [LSE_EXP_DATES]   DATETIME      NULL,
    [LSE_PART_DEC]    VARCHAR (8)   NULL,
    [STATE_LEASE]     VARCHAR (20)  NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_KS_LSE_RR_KS_ST_LSE_ID_in]
    ON [dbo].[RR_KS_LSE]([RR_KS_ST_LSE_ID] ASC);
