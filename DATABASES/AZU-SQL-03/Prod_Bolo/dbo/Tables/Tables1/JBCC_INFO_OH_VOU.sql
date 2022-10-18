CREATE TABLE [dbo].[JBCC_INFO_OH_VOU] (
    [subValueId]               VARCHAR (255)   NOT NULL,
    [JBCC_INFO_OH_ID]          VARCHAR (255)   NULL,
    [OH_AMTS]                  NUMERIC (19, 2) NULL,
    [OH_EFF_DATES]             DATETIME        NULL,
    [OH_VOUCHERS]              VARCHAR (13)    NULL,
    [OH_VOUCHER_PROCESS_DATES] DATETIME        NULL,
    [time_stamp]               DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JBCC_INFO_JBCC_INFO_78580]
    ON [dbo].[JBCC_INFO_OH_VOU]([JBCC_INFO_OH_ID] ASC);

