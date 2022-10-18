CREATE TABLE [dbo].[RECEIPT_APPLD] (
    [RECEIPT_APPLD_ID]               VARCHAR (255)   NOT NULL,
    [u2_id]                          VARCHAR (255)   NULL,
    [APPLIED_AMTS]                   NUMERIC (19, 2) NULL,
    [APPLIED_CUSTOMER_VOUCHER_INDEX] VARCHAR (20)    NULL,
    [SOURCE_DOCUMENTS]               VARCHAR (25)    NULL,
    [TRANS_INDEX]                    VARCHAR (9)     NULL,
    [TRANS_TYPES]                    VARCHAR (5)     NULL,
    [time_stamp]                     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RECEIPT_APPLD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RECEIPT_APPLD_u2_id_in]
    ON [dbo].[RECEIPT_APPLD]([u2_id] ASC);

