CREATE TABLE [RiskMgmt].[History_Status] (
    [StatusHistoryID]    INT           IDENTITY (1, 1) NOT NULL,
    [RiskID]             INT           NOT NULL,
    [StartDate]          DATETIME2 (7) NOT NULL,
    [EndDate]            DATETIME2 (7) NULL,
    [Status]             VARCHAR (20)  NOT NULL,
    [Initial_Value_Flag] VARCHAR (1)   NULL,
    CONSTRAINT [PK_StatusHistory] PRIMARY KEY CLUSTERED ([StatusHistoryID] ASC),
    CONSTRAINT [FK_StatusHistory_Risk] FOREIGN KEY ([RiskID]) REFERENCES [RiskMgmt].[Risk] ([RiskID])
);

