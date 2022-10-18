﻿CREATE TABLE [Upstream].[UV_AC_PRODUCT_AT] (
    [API]                    VARCHAR (20)  NOT NULL,
    [Month_Start_Date]       DATETIME2 (7) NOT NULL,
    [YEAR]                   INT           NULL,
    [MONTH]                  INT           NULL,
    [TOT_LIQUID]             DECIMAL (18)  NULL,
    [TOT_GAS]                DECIMAL (18)  NULL,
    [TOT_WATER]              DECIMAL (18)  NULL,
    [TOT_BOE]                DECIMAL (18)  NULL,
    [MAX_NUM_WELLS]          INT           NULL,
    [MAX_DAYS_ON]            INT           NULL,
    [RECORD_CREATION_DATE]   DATETIME2 (7) NULL,
    [RECORD_UPDATE_DATE]     DATETIME2 (7) NULL,
    [PeakProdDate]           DATETIME2 (7) NULL,
    [FirstProdDate]          DATETIME2 (7) NULL,
    [Months_Since_PeakProd]  INT           NULL,
    [Months_Since_FirstProd] INT           NULL,
    [TPC_Play_Name]          VARCHAR (60)  NULL,
    [EIA_Play_Name]          VARCHAR (60)  NULL,
    CONSTRAINT [PK_UV_AC_PRODUCT_AT] PRIMARY KEY CLUSTERED ([API] ASC, [Month_Start_Date] ASC)
);

