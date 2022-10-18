CREATE TABLE [dbo].[PROD_FAC_PRD_FMP] (
    [subValueId]                   VARCHAR (255) NOT NULL,
    [PROD_FAC_PRD_MMS_EFF_DATE_ID] VARCHAR (255) NULL,
    [MMS_FMP_NOS]                  VARCHAR (10)  NULL,
    [MMS_FMP_TYPES]                VARCHAR (4)   NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_FAC__PROD_FAC__25597]
    ON [dbo].[PROD_FAC_PRD_FMP]([PROD_FAC_PRD_MMS_EFF_DATE_ID] ASC);

