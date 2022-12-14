CREATE TABLE [dbo].[AR_OG_SALES_ACCTG_PER] (
    [AR_OG_SALES_ACCTG_PER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [ACCTG_PERIODS]            DATETIME      NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AR_OG_SALES_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AR_OG_SALES_ACCTG_PER_u2_id_in]
    ON [dbo].[AR_OG_SALES_ACCTG_PER]([u2_id] ASC);

