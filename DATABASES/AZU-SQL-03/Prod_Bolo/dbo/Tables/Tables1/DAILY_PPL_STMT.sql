CREATE TABLE [dbo].[DAILY_PPL_STMT] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ALLOC_DATE]             DATETIME        NULL,
    [CASH_OUT_AMT]           NUMERIC (19, 2) NULL,
    [MEAS_PT]                VARCHAR (7)     NULL,
    [PLANT_PRODUCT_PROCEEDS] NUMERIC (19, 2) NULL,
    [PROD_PERIOD]            DATETIME        NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

