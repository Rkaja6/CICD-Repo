CREATE TABLE [dbo].[PROJ_ACC_POST] (
    [PROJ_ACC_POST_ID]             VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [ACCRUAL_POSTED_ACCTG_PERIODS] DATETIME      NULL,
    [ACCRUAL_VOUCHERS]             DATETIME      NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROJ_ACC_POST_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROJ_ACC_POST_u2_id_in]
    ON [dbo].[PROJ_ACC_POST]([u2_id] ASC);

