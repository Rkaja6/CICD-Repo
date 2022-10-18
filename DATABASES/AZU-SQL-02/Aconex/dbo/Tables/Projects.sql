CREATE TABLE [dbo].[Projects] (
    [ProjectId]          INT            NOT NULL,
    [ProjectOwnerId]     INT            NOT NULL,
    [ProjectName]        VARCHAR (200)  NULL,
    [ProjectShortName]   VARCHAR (200)  NULL,
    [ProjectDescription] VARCHAR (8000) NULL
);

