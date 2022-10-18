CREATE TABLE [RiskMgmt].[History_Impact] (
    [ImpactHistoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [RiskID]             INT           NOT NULL,
    [StartDate]          DATETIME2 (7) NOT NULL,
    [EndDate]            DATETIME2 (7) NULL,
    [Impact]             INT           NULL,
    [Initial_Value_Flag] VARCHAR (1)   NULL,
    CONSTRAINT [PK_ImpactHistory] PRIMARY KEY CLUSTERED ([ImpactHistoryID] ASC),
    CONSTRAINT [FK_ImpactHistory_Risk] FOREIGN KEY ([RiskID]) REFERENCES [RiskMgmt].[Risk] ([RiskID])
);

