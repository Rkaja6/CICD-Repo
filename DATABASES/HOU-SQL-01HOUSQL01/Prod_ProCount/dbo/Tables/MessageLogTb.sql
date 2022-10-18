CREATE TABLE [dbo].[MessageLogTb] (
    [MessageLogID]       UNIQUEIDENTIFIER NOT NULL,
    [Application]        VARCHAR (50)     NOT NULL,
    [ApplicationVersion] VARCHAR (20)     NULL,
    [ProcessID]          VARCHAR (50)     NULL,
    [Severity]           INT              NOT NULL,
    [Message]            VARCHAR (4000)   NOT NULL,
    [StackTrace]         VARCHAR (4000)   NOT NULL,
    [Category]           VARCHAR (50)     NULL,
    [MessageDate]        DATETIME         NOT NULL,
    [ObjectType]         INT              NULL,
    [ObjectId]           INT              NULL,
    [UserGUID]           UNIQUEIDENTIFIER NULL
);

