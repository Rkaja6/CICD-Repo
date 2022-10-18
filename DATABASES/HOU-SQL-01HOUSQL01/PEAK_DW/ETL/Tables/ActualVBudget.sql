CREATE TABLE [ETL].[ActualVBudget] (
    [Amount Type]            NVARCHAR (255) NULL,
    [Date]                   DATETIME       NULL,
    [Gas Sales Volumes]      FLOAT (53)     NULL,
    [Oil Sales Volumes]      FLOAT (53)     NULL,
    [Gas Sales Revenues]     FLOAT (53)     NULL,
    [Oil Sales Revenues]     FLOAT (53)     NULL,
    [Processing Rev/Deducts] FLOAT (53)     NULL,
    [Production taxes]       FLOAT (53)     NULL,
    [LOE - Recurring]        FLOAT (53)     NULL,
    [LOE - Non Recurring]    FLOAT (53)     NULL,
    [Expense Workover]       FLOAT (53)     NULL,
    [Ad valorem taxes]       FLOAT (53)     NULL,
    [Capital expenditures]   FLOAT (53)     NULL
);

