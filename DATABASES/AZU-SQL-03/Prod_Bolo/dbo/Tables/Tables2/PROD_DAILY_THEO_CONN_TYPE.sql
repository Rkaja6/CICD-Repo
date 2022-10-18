﻿CREATE TABLE [dbo].[PROD_DAILY_THEO_CONN_TYPE] (
    [PROD_DAILY_THEO_CONN_TYPE_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                        VARCHAR (255)   NULL,
    [AGGREGATE_OUTPUT_MMBTU]       NUMERIC (19, 2) NULL,
    [CONNECTION_TYPES]             VARCHAR (15)    NULL,
    [OUTPUT_MMBTU]                 NUMERIC (19, 2) NULL,
    [OUTPUT_VOL]                   NUMERIC (19, 2) NULL,
    [time_stamp]                   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_THEO_CONN_TYPE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAIL_u2_id_2837]
    ON [dbo].[PROD_DAILY_THEO_CONN_TYPE]([u2_id] ASC);

