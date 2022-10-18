CREATE TABLE [dbo].[AT_ASSET_DET_LYR_ACCTG_PEDS] (
    [subValueId]                       VARCHAR (255)   NOT NULL,
    [AT_ASSET_DET_LYR_PER_ID]          VARCHAR (255)   NULL,
    [LAYER_ACCTG_PERIODS]              DATETIME        NULL,
    [LAYER_ACCUM_DDA]                  NUMERIC (19, 2) NULL,
    [LAYER_ACCUM_DDA_ADJ_AMTS]         NUMERIC (19, 2) NULL,
    [LAYER_ADDITIONS]                  NUMERIC (19, 2) NULL,
    [LAYER_ADJ_AMTS]                   NUMERIC (19, 2) NULL,
    [LAYER_ADJ_TYPES]                  VARCHAR (5)     NULL,
    [LAYER_AMTS]                       NUMERIC (19, 2) NULL,
    [LAYER_BALFWD_ACCUM_DDA]           NUMERIC (19, 2) NULL,
    [LAYER_BALFWD_UOP_EXPENSE_PERIODS] DATETIME        NULL,
    [LAYER_RETIREMENTS]                NUMERIC (19, 2) NULL,
    [time_stamp]                       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_ASSET__AT_ASSET__45287]
    ON [dbo].[AT_ASSET_DET_LYR_ACCTG_PEDS]([AT_ASSET_DET_LYR_PER_ID] ASC);

