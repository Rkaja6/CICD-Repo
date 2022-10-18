CREATE TABLE [RiskMgmt].[History_Likelihood] (
    [LikelihoodHistoryID] INT           IDENTITY (1, 1) NOT NULL,
    [RiskID]              INT           NOT NULL,
    [StartDate]           DATETIME2 (7) NOT NULL,
    [EndDate]             DATETIME2 (7) NULL,
    [Likelihood]          INT           NULL,
    [Initial_Value_Flag]  VARCHAR (1)   NULL,
    CONSTRAINT [PK_LikelihoodHistory] PRIMARY KEY CLUSTERED ([LikelihoodHistoryID] ASC),
    CONSTRAINT [FK_LikelihoodHistory_Risk] FOREIGN KEY ([RiskID]) REFERENCES [RiskMgmt].[Risk] ([RiskID])
);

