CREATE TABLE [dbo].[CBD_SYS_ACCT] (
    [CBD_SYS_ACCT_ID]             VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [AFE_ACCRUAL_ACCTS]           VARCHAR (9)   NULL,
    [AFE_ACCRUAL_COST_CATEGORIES] VARCHAR (10)  NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CBD_SYS_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CBD_SYS_ACCT_u2_id_in]
    ON [dbo].[CBD_SYS_ACCT]([u2_id] ASC);

