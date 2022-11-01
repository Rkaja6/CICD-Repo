﻿CREATE TABLE [DW].[SatLandDeck] (
    [RecordSource]            VARCHAR (50)    NOT NULL,
    [LoadDate]                DATETIME2 (7)   CONSTRAINT [DF_SatLandDeck_LoadDate] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]             DATETIME2 (7)   NULL,
    [DESCRIPTION]             VARCHAR (240)   NULL,
    [INACTIVE_DATE]           DATETIME        NULL,
    [INACTIVE_REASON]         VARCHAR (50)    NULL,
    [MAJOR_ACCT]              VARCHAR (12)    NULL,
    [SUB_ACCT]                VARCHAR (12)    NULL,
    [PROJECT]                 VARCHAR (10)    NULL,
    [PROPERTY]                VARCHAR (8)     NULL,
    [PRODUCT]                 VARCHAR (3)     NULL,
    [PARENT_DOI]              VARCHAR (6)     NULL,
    [NRI_RPTG_DOI]            VARCHAR (4)     NULL,
    [WI_RPTG_DECK]            VARCHAR (4)     NULL,
    [NRI_COMPLETE_FLAG]       VARCHAR (4)     NULL,
    [RI_COMPLETE_FLAG]        VARCHAR (4)     NULL,
    [WI_COMPLETE_FLAG]        VARCHAR (4)     NULL,
    [BUR_COMPLETE_FLAG]       VARCHAR (4)     NULL,
    [CPT_COMPLETE_FLAG]       VARCHAR (4)     NULL,
    [SUSPEND_FLAG]            VARCHAR (4)     NULL,
    [TOTAL_NRI_ENTERED]       NUMERIC (19, 8) NULL,
    [TOTAL_ROYALTIES_ENTERED] NUMERIC (19, 8) NULL,
    [TOTAL_WI_ENTERED]        NUMERIC (19, 8) NULL,
    [LandDeckHashKey]         BINARY (32)     NOT NULL,
    CONSTRAINT [PK_SatLandDeck] PRIMARY KEY NONCLUSTERED ([LandDeckHashKey] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);
