CREATE TABLE [dbo].[LEASE_PMT_RPT_CURR] (
    [subValueId] VARCHAR (255)   NOT NULL,
    [CURR_AMTS]  NUMERIC (19, 2) NULL,
    [RPT_CURRS]  VARCHAR (4)     NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_PMT_subValueId_26054]
    ON [dbo].[LEASE_PMT_RPT_CURR]([subValueId] ASC);

