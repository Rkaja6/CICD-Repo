CREATE TABLE [dbo].[LEASE_PMT_ADJ] (
    [subValueId]        VARCHAR (255)   NOT NULL,
    [LEASE_PMT_ADJS_ID] VARCHAR (255)   NULL,
    [ADJ_AMTS]          NUMERIC (19, 2) NULL,
    [ADJ_DATES]         DATETIME        NULL,
    [ADJ_DOCS]          VARCHAR (20)    NULL,
    [ADJ_TYPES]         VARCHAR (5)     NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LEASE_PMT_LEASE_PMT_18151]
    ON [dbo].[LEASE_PMT_ADJ]([LEASE_PMT_ADJS_ID] ASC);

