CREATE TABLE [dbo].[LEASE_PAY_TRACT] (
    [LEASE_PAY_TRACT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [TRACTS]             VARCHAR (6)     NULL,
    [TRACT_AMTS]         NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LEASE_PAY_TRACT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_PAY_TRACT_u2_id_in]
    ON [dbo].[LEASE_PAY_TRACT]([u2_id] ASC);

