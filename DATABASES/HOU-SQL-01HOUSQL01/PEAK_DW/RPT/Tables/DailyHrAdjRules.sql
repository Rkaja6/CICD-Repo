CREATE TABLE [RPT].[DailyHrAdjRules] (
    [Rule ID]           INT             IDENTITY (1, 1) NOT NULL,
    [Employee ID]       NVARCHAR (20)   NOT NULL,
    [Start Date]        DATETIME        NOT NULL,
    [End Date]          DATETIME        NOT NULL,
    [Adjustment Type]   NVARCHAR (200)  NOT NULL,
    [Adjustment Amount] FLOAT (53)      NOT NULL,
    [Rule Description]  NVARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([Rule ID] ASC)
);

