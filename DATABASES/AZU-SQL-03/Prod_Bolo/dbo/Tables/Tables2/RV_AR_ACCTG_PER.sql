CREATE TABLE [dbo].[RV_AR_ACCTG_PER] (
    [RV_AR_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [ACCTG_PERIODS]      DATETIME        NULL,
    [BAL]                NUMERIC (19, 2) NULL,
    [BAL_QTY1]           NUMERIC (19, 2) NULL,
    [BAL_QTY2]           NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RV_AR_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_AR_ACCTG_PER_u2_id_in]
    ON [dbo].[RV_AR_ACCTG_PER]([u2_id] ASC);

