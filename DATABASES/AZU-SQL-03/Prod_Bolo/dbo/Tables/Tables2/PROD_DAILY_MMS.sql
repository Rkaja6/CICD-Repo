CREATE TABLE [dbo].[PROD_DAILY_MMS] (
    [PROD_DAILY_MMS_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [MMS_FMP_NOS]       VARCHAR (3)   NULL,
    [MMS_FMP_TYPES]     VARCHAR (5)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_DAILY_MMS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_DAILY_MMS_u2_id_in]
    ON [dbo].[PROD_DAILY_MMS]([u2_id] ASC);

