CREATE TABLE [dbo].[PTRSHP_COA_GRP_ACCT] (
    [PTRSHP_COA_GRP_ACCT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [EXCLUDED_ACCTS]         VARCHAR (15)  NULL,
    [INCLUDED_ACCTS]         VARCHAR (15)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_COA_GRP_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_COA_GRP_ACCT_u2_id_in]
    ON [dbo].[PTRSHP_COA_GRP_ACCT]([u2_id] ASC);

