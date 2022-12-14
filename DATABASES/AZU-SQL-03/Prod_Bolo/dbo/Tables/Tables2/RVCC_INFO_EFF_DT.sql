CREATE TABLE [dbo].[RVCC_INFO_EFF_DT] (
    [RVCC_INFO_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [EFF_DATES]           DATETIME      NULL,
    [TAX_CLASSES]         VARCHAR (5)   NULL,
    [TAX_CLASS_EXP_DATES] DATETIME      NULL,
    [TAX_CLASS_PRODUCT]   VARCHAR (7)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RVCC_INFO_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RVCC_INFO_EFF_DT_u2_id_in]
    ON [dbo].[RVCC_INFO_EFF_DT]([u2_id] ASC);

