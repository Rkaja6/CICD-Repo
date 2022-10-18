﻿CREATE TABLE [dbo].[OG_SALE_CTL_RV_AR] (
    [OG_SALE_CTL_RV_AR_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [RV_AR_APPLIED_AMTS]   NUMERIC (19, 2) NULL,
    [RV_AR_CONTRACT_INDEX] VARCHAR (8)     NULL,
    [RV_AR_INDEX]          VARCHAR (11)    NULL,
    [RV_AR_PRODUCT_INDEX]  VARCHAR (8)     NULL,
    [RV_AR_RECEIPT_INDEX]  VARCHAR (7)     NULL,
    [RV_AR_SEQS]           VARCHAR (8)     NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OG_SALE_CTL_RV_AR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_SALE_CTL_RV_AR_u2_id_in]
    ON [dbo].[OG_SALE_CTL_RV_AR]([u2_id] ASC);

