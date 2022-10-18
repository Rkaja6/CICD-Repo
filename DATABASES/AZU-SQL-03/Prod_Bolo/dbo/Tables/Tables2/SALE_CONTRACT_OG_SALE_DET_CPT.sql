CREATE TABLE [dbo].[SALE_CONTRACT_OG_SALE_DET_CPT] (
    [SALE_CONTRACT_OG_SALE_DET_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                            VARCHAR (255)   NULL,
    [CPTS]                             VARCHAR (6)     NULL,
    [CPT_BASIS]                        VARCHAR (10)    NULL,
    [CPT_DISPS]                        VARCHAR (3)     NULL,
    [GROSS_CPT_VALUES]                 NUMERIC (19, 2) NULL,
    [time_stamp]                       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([SALE_CONTRACT_OG_SALE_DET_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [SALE_CONT_u2_id_55167]
    ON [dbo].[SALE_CONTRACT_OG_SALE_DET_CPT]([u2_id] ASC);

