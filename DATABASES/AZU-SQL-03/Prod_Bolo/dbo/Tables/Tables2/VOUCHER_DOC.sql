CREATE TABLE [dbo].[VOUCHER_DOC] (
    [VOUCHER_DOC_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [DOCUMENTS]      VARCHAR (53)  NULL,
    [DOC_STATUS]     VARCHAR (5)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([VOUCHER_DOC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [VOUCHER_DOC_u2_id_in]
    ON [dbo].[VOUCHER_DOC]([u2_id] ASC);

