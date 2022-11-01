﻿CREATE TABLE [dbo].[PROD_MO_STATUS_DAY] (
    [PROD_MO_STATUS_DAY_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [DAILY_STATUS]          VARCHAR (6)   NULL,
    [NO_DAYS]               VARCHAR (5)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_MO_STATUS_DAY_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_MO_STATUS_DAY_u2_id_in]
    ON [dbo].[PROD_MO_STATUS_DAY]([u2_id] ASC);
