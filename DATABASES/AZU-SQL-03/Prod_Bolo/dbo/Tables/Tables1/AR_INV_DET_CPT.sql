CREATE TABLE [dbo].[AR_INV_DET_CPT] (
    [AR_INV_DET_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [CPTS]              VARCHAR (6)     NULL,
    [CPT_AMTS]          NUMERIC (19, 2) NULL,
    [CPT_BASIS]         VARCHAR (10)    NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AR_INV_DET_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_INV_DET_CPT_u2_id_in]
    ON [dbo].[AR_INV_DET_CPT]([u2_id] ASC);

