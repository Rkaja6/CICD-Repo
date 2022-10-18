CREATE TABLE [dbo].[ENT_BALFWD_ACCTG_PER] (
    [ENT_BALFWD_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCTG_PERIODS]           DATETIME        NULL,
    [CUMM_VALUES]             NUMERIC (19, 2) NULL,
    [CUMM_VOLUMES]            NUMERIC (19, 2) NULL,
    [GROSS_WI]                NUMERIC (19, 8) NULL,
    [GROSS_WI_VOLUMES]        NUMERIC (19, 2) NULL,
    [NRI]                     NUMERIC (19, 8) NULL,
    [PRICES]                  NUMERIC (19, 3) NULL,
    [RATIO_INTEREST]          NUMERIC (19, 8) NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ENT_BALFWD_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ENT_BALFWD_ACCTG_PER_u2_id_in]
    ON [dbo].[ENT_BALFWD_ACCTG_PER]([u2_id] ASC);

