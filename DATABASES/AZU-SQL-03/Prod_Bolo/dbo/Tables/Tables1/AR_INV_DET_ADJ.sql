CREATE TABLE [dbo].[AR_INV_DET_ADJ] (
    [AR_INV_DET_ADJ_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [ADJ_AMTS]          NUMERIC (19, 2) NULL,
    [ADJ_DATES]         DATETIME        NULL,
    [ADJ_DOCS]          VARCHAR (21)    NULL,
    [ADJ_TYPES]         VARCHAR (5)     NULL,
    [TRANS_INDEX]       VARCHAR (9)     NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AR_INV_DET_ADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_INV_DET_ADJ_u2_id_in]
    ON [dbo].[AR_INV_DET_ADJ]([u2_id] ASC);

