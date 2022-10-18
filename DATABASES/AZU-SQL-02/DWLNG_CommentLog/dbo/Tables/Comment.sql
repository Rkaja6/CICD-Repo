CREATE TABLE [dbo].[Comment] (
    [CommentID]                VARCHAR (20)   NOT NULL,
    [DocumentSNumber]          INT            NULL,
    [DocumentNumber]           VARCHAR (50)   NULL,
    [DocumentTitle]            VARCHAR (255)  NULL,
    [CommentReceivedDate]      DATETIME       NULL,
    [MRNumber]                 VARCHAR (50)   NULL,
    [BechtelRE]                VARCHAR (50)   NULL,
    [PageNumber]               VARCHAR (200)  NULL,
    [CommentText]              VARCHAR (8000) NULL,
    [BechtelDisposition]       VARCHAR (8000) NULL,
    [IssuedInConferenceNumber] VARCHAR (50)   NULL,
    [UserId]                   INT            NULL,
    [UpdatedDate]              DATETIME       NULL,
    [CreatedDate]              DATETIME       NULL,
    [CommentBy]                VARCHAR (50)   NULL,
    [CommentDispositionDate]   DATETIME       NULL,
    [LockRecord]               VARCHAR (1)    NULL,
    CONSTRAINT [comment_id_pk] PRIMARY KEY CLUSTERED ([CommentID] ASC)
);

