CREATE TABLE [RiskMgmt].[PickList_Status] (
    [StatusID] INT          IDENTITY (1, 1) NOT NULL,
    [Status]   VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([StatusID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status', @level0type = N'SCHEMA', @level0name = N'RiskMgmt', @level1type = N'TABLE', @level1name = N'PickList_Status';

