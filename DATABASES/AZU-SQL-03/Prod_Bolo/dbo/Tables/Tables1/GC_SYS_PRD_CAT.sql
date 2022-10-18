CREATE TABLE [dbo].[GC_SYS_PRD_CAT] (
    [GC_SYS_PRD_CAT_ID]         VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [COMMIT_FLAG]               VARCHAR (6)   NULL,
    [DFLT_ENTITLEMENT_PRODUCTS] VARCHAR (4)   NULL,
    [DFLT_MAKEUP_PCT]           VARCHAR (11)  NULL,
    [PRODUCT_CATEGORY]          VARCHAR (8)   NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GC_SYS_PRD_CAT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GC_SYS_PRD_CAT_u2_id_in]
    ON [dbo].[GC_SYS_PRD_CAT]([u2_id] ASC);

