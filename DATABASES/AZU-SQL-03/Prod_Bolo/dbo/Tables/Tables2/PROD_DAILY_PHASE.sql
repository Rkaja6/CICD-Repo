﻿CREATE TABLE [dbo].[PROD_DAILY_PHASE] (
    [subValueId]           VARCHAR (255) NOT NULL,
    [PROD_DAILY_DISPS_ID]  VARCHAR (255) NULL,
    [ALLOCATED_DISP_FLAGS] VARCHAR (10)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAIL_PROD_DAIL_20053]
    ON [dbo].[PROD_DAILY_PHASE]([PROD_DAILY_DISPS_ID] ASC);

