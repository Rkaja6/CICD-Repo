CREATE TABLE [dbo].[AR_INV_ADJ] (
    [AR_INV_ADJ_ID]      VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [ADJ_DOCS]           VARCHAR (21)    NULL,
    [APPLIED_CHECK_AMTS] NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AR_INV_ADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_INV_ADJ_u2_id_in]
    ON [dbo].[AR_INV_ADJ]([u2_id] ASC);

