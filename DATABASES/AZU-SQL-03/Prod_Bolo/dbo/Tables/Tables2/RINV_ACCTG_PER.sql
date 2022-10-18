CREATE TABLE [dbo].[RINV_ACCTG_PER] (
    [RINV_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [ACCTG_PERIODS]     DATETIME        NULL,
    [AMTS]              NUMERIC (19, 2) NULL,
    [GROSS_AMTS]        NUMERIC (19, 2) NULL,
    [QTY1S]             NUMERIC (19, 2) NULL,
    [QTY2S]             NUMERIC (19, 2) NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RINV_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RINV_ACCTG_PER_u2_id_in]
    ON [dbo].[RINV_ACCTG_PER]([u2_id] ASC);

