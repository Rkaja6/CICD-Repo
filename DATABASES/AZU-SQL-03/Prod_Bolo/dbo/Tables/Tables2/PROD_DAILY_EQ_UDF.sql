﻿CREATE TABLE [dbo].[PROD_DAILY_EQ_UDF] (
    [PROD_DAILY_EQ_UDF_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [USER_DATA_FIELDS]     VARCHAR (9)   NULL,
    [USER_DATA_VALUES]     VARCHAR (15)  NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_EQ_UDF_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAILY_EQ_UDF_u2_id_in]
    ON [dbo].[PROD_DAILY_EQ_UDF]([u2_id] ASC);

