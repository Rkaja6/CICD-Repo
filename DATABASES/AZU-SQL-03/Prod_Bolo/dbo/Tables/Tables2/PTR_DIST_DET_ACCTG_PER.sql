CREATE TABLE [dbo].[PTR_DIST_DET_ACCTG_PER] (
    [PTR_DIST_DET_ACCTG_PER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [ACCTG_PERIODS]             DATETIME      NULL,
    [ACCTS]                     VARCHAR (12)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTR_DIST_DET_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTR_DIST__u2_id_4750]
    ON [dbo].[PTR_DIST_DET_ACCTG_PER]([u2_id] ASC);

