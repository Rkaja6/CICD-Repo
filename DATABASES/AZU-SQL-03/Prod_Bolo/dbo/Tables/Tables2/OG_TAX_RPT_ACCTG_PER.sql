﻿CREATE TABLE [dbo].[OG_TAX_RPT_ACCTG_PER] (
    [OG_TAX_RPT_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCTG_PERIODS]           DATETIME        NULL,
    [ADJ_GROSS_VALUES]        NUMERIC (19, 2) NULL,
    [ADJ_GROSS_VOLS]          NUMERIC (19, 2) NULL,
    [ALLOCATION_PERCENTS]     NUMERIC (19, 8) NULL,
    [ALT_PROPERTIES]          VARCHAR (25)    NULL,
    [GROSS_VALUES]            NUMERIC (19, 2) NULL,
    [GROSS_VOLS]              NUMERIC (19, 2) NULL,
    [OPERATORS]               VARCHAR (16)    NULL,
    [SUPPRESS_RPT_FLAGS]      VARCHAR (8)     NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OG_TAX_RPT_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OG_TAX_RPT_ACCTG_PER_u2_id_in]
    ON [dbo].[OG_TAX_RPT_ACCTG_PER]([u2_id] ASC);
