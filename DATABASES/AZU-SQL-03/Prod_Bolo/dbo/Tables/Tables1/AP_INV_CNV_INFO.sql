CREATE TABLE [dbo].[AP_INV_CNV_INFO] (
    [AP_INV_CNV_INFO_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CNV_ID]             VARCHAR (10)  NULL,
    [CNV_NAME]           VARCHAR (10)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AP_INV_CNV_INFO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_INV_CNV_INFO_u2_id_in]
    ON [dbo].[AP_INV_CNV_INFO]([u2_id] ASC);

