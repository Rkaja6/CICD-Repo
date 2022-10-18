CREATE TABLE [dbo].[AT_ASSET_DET_ACCTG_PER] (
    [AT_ASSET_DET_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                     VARCHAR (255)   NULL,
    [ACCTG_PERIODS]             DATETIME        NULL,
    [ACCUM_DDA]                 NUMERIC (19, 2) NULL,
    [ACCUM_DDA_ADJ_AMTS]        NUMERIC (19, 2) NULL,
    [ADDITIONS]                 NUMERIC (19, 2) NULL,
    [ADJ_AMTS]                  NUMERIC (19, 2) NULL,
    [ADJ_TYPES]                 VARCHAR (4)     NULL,
    [AMTS]                      NUMERIC (19, 2) NULL,
    [BALFWD_ACCUM_DDA_AMTS]     NUMERIC (19, 2) NULL,
    [RETIREMENTS]               NUMERIC (19, 2) NULL,
    [TEMP_ACCUM_DDA]            NUMERIC (19, 2) NULL,
    [time_stamp]                DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AT_ASSET_DET_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_ASSET__u2_id_92106]
    ON [dbo].[AT_ASSET_DET_ACCTG_PER]([u2_id] ASC);

