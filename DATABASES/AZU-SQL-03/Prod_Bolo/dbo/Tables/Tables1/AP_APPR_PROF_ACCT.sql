CREATE TABLE [dbo].[AP_APPR_PROF_ACCT] (
    [AP_APPR_PROF_ACCT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [ACCTS]                VARCHAR (11)    NULL,
    [LIMITS]               NUMERIC (19, 2) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AP_APPR_PROF_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_APPR_PROF_ACCT_u2_id_in]
    ON [dbo].[AP_APPR_PROF_ACCT]([u2_id] ASC);

