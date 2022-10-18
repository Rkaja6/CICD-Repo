CREATE TABLE [dbo].[LEASE_PAYEE_PMT] (
    [LEASE_PAYEE_PMT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [BANK_ACCT]          VARCHAR (12)    NULL,
    [PMT_AMTS]           NUMERIC (19, 2) NULL,
    [PMT_INTERESTS]      NUMERIC (19, 8) NULL,
    [PMT_TYPES]          VARCHAR (8)     NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LEASE_PAYEE_PMT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_PAYEE_PMT_u2_id_in]
    ON [dbo].[LEASE_PAYEE_PMT]([u2_id] ASC);

