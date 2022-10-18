CREATE TABLE [RiskMgmt].[Risk] (
    [RiskID]           INT            IDENTITY (1, 1) NOT NULL,
    [Title]            VARCHAR (200)  NOT NULL,
    [Description]      VARCHAR (1000) NOT NULL,
    [Category]         VARCHAR (50)   NULL,
    [RiskGroup]        VARCHAR (50)   NULL,
    [Response]         VARCHAR (20)   NULL,
    [Type]             VARCHAR (20)   NULL,
    [Opportunity_Flag] VARCHAR (1)    NULL,
    [Owner_PersonID]   INT            NULL,
    [Related_Project]  VARCHAR (50)   NULL,
    [ProjectID]        INT            NULL,
    [Cost_Flag]        VARCHAR (1)    NULL,
    [Schedule_Flag]    VARCHAR (1)    NULL,
    [HSE_Flag]         VARCHAR (1)    NULL,
    CONSTRAINT [PK_Risk] PRIMARY KEY CLUSTERED ([RiskID] ASC)
);

