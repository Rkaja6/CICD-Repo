CREATE TABLE [RiskMgmt].[Tag_Additional_People] (
    [AdditionalPeopleID] INT IDENTITY (1, 1) NOT NULL,
    [RiskID]             INT NOT NULL,
    [PersonID]           INT NULL,
    CONSTRAINT [PK_Tag_Additional_People] PRIMARY KEY CLUSTERED ([AdditionalPeopleID] ASC),
    CONSTRAINT [FK_Tag_Additional_People_Person] FOREIGN KEY ([PersonID]) REFERENCES [RiskMgmt].[Person] ([PersonID]),
    CONSTRAINT [FK_Tag_Additional_People_Risk] FOREIGN KEY ([RiskID]) REFERENCES [RiskMgmt].[Risk] ([RiskID])
);

