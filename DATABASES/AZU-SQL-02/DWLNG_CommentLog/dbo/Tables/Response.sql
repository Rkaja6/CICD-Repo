CREATE TABLE [dbo].[Response] (
    [CommentID]             VARCHAR (50)   NOT NULL,
    [ResponseToDisposition] VARCHAR (8000) NULL,
    [Status]                VARCHAR (20)   NULL,
    [UserId]                INT            NULL,
    [UpdatedDate]           DATETIME       NULL,
    [CreatedDate]           DATETIME       NULL,
    [CommentClosedDate]     DATETIME       NULL,
    [DocumentNumber]        VARCHAR (50)   NULL,
    [LockRecord]            VARCHAR (1)    NULL,
    CONSTRAINT [response_comment_id_pk] PRIMARY KEY CLUSTERED ([CommentID] ASC)
);

