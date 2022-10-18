CREATE TABLE [dbo].[FileNumber] (
    [Id]           INT            NOT NULL,
    [Title]        VARCHAR (200)  NULL,
    [LegacyNumber] VARCHAR (2000) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

