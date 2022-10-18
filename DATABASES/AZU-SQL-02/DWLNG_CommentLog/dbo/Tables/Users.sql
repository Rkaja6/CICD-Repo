CREATE TABLE [dbo].[Users] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [RoleId]       INT           NOT NULL,
    [UserKey]      VARCHAR (100) NULL,
    [Name]         VARCHAR (100) NULL,
    [EmailAddress] VARCHAR (100) NULL,
    [CompanyName]  VARCHAR (100) NULL,
    [UpdatedDate]  DATETIME      DEFAULT (getdate()) NULL,
    [CreatedDate]  DATETIME      DEFAULT (getdate()) NULL
);

