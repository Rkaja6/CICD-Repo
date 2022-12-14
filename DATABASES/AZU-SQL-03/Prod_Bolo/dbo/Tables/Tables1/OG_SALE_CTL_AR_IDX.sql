CREATE TABLE [dbo].[OG_SALE_CTL_AR_IDX] (
    [OG_SALE_CTL_AR_IDX_ID]    VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [APPLIED_AR_INV_DET_INDEX] VARCHAR (10)  NULL,
    [RECEIPT_ADJ_INDEX]        VARCHAR (11)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_CTL_AR_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_CTL_AR_IDX_u2_id_in]
    ON [dbo].[OG_SALE_CTL_AR_IDX]([u2_id] ASC);

