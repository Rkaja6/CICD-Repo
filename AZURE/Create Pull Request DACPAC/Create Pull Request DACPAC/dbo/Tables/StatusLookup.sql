CREATE TABLE [dbo].[StatusLookup] (
    [StatusKey]       INT           NOT NULL,
    [StatusFirstName] VARCHAR (255) NULL,
    [StatusLastName]  VARCHAR (255) NULL,
    CONSTRAINT [StatusLookUpPK] PRIMARY KEY CLUSTERED ([StatusKey] ASC)
);

