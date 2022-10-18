CREATE TABLE [RiskMgmt].[History_Action] (
    [ActionHistoryID] INT            IDENTITY (1, 1) NOT NULL,
    [RiskID]          INT            NOT NULL,
    [ActionDate]      DATETIME2 (7)  NOT NULL,
    [ActionBy]        VARCHAR (50)   NULL,
    [ActionDesc]      VARCHAR (20)   NOT NULL,
    [Attribrute]      VARCHAR (50)   NULL,
    [HistoryTable]    VARCHAR (20)   NULL,
    [HistoryTableID]  INT            NULL,
    [ActionComment]   VARCHAR (1000) NULL,
    CONSTRAINT [PK_ActionHistory] PRIMARY KEY CLUSTERED ([ActionHistoryID] ASC),
    CONSTRAINT [FK_ActionHistory_Risk] FOREIGN KEY ([RiskID]) REFERENCES [RiskMgmt].[Risk] ([RiskID])
);

