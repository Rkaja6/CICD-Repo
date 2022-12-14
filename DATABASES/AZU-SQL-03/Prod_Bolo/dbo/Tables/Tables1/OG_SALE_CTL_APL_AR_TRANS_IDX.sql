CREATE TABLE [dbo].[OG_SALE_CTL_APL_AR_TRANS_IDX] (
    [subValueId]                     VARCHAR (255) NOT NULL,
    [OG_SALE_CTL_AR_IDX_ID]          VARCHAR (255) NULL,
    [APPLIED_AR_INV_DET_TRANS_INDEX] VARCHAR (10)  NULL,
    [time_stamp]                     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_C_OG_SALE_C_19819]
    ON [dbo].[OG_SALE_CTL_APL_AR_TRANS_IDX]([OG_SALE_CTL_AR_IDX_ID] ASC);

