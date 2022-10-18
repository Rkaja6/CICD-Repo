CREATE TABLE [dbo].[Roles] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (100) NULL,
    [UpdatedDate] DATETIME      DEFAULT (getdate()) NULL,
    [CreatedDate] DATETIME      DEFAULT (getdate()) NULL
);

