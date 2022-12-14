CREATE TABLE [dbo].[RECEIPT_ADJ_TRANS] (
    [RECEIPT_ADJ_TRANS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [SRC_DOCUMENT]         VARCHAR (8)   NULL,
    [TRANS_IDX]            VARCHAR (8)   NULL,
    [TRANS_TYPES]          VARCHAR (4)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RECEIPT_ADJ_TRANS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RECEIPT_ADJ_TRANS_u2_id_in]
    ON [dbo].[RECEIPT_ADJ_TRANS]([u2_id] ASC);

