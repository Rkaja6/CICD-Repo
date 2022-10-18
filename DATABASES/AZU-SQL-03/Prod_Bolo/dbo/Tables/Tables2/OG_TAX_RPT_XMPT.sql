CREATE TABLE [dbo].[OG_TAX_RPT_XMPT] (
    [subValueId]              VARCHAR (255)   NOT NULL,
    [OG_TAX_RPT_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [ADJ_EXEMPT_VALUES]       NUMERIC (19, 2) NULL,
    [ADJ_EXEMPT_VOLS]         NUMERIC (19, 2) NULL,
    [CPTS]                    VARCHAR (6)     NULL,
    [CPT_AMTS]                NUMERIC (19, 2) NULL,
    [EXEMPT_CODES]            VARCHAR (6)     NULL,
    [EXEMPT_DECIMALS]         NUMERIC (19, 8) NULL,
    [EXEMPT_VALUES]           NUMERIC (19, 2) NULL,
    [EXEMPT_VOLS]             NUMERIC (19, 2) NULL,
    [RPTS]                    VARCHAR (6)     NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_TAX_RP_OG_TAX_RP_66166]
    ON [dbo].[OG_TAX_RPT_XMPT]([OG_TAX_RPT_ACCTG_PER_ID] ASC);

