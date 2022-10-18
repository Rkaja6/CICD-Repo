CREATE TABLE [dbo].[Workflow] (
    [ProjectShortName]      VARCHAR (200)  NULL,
    [WorkflowNumber]        VARCHAR (200)  NULL,
    [WorkflowName]          VARCHAR (8000) NULL,
    [Status]                VARCHAR (200)  NULL,
    [StepName]              VARCHAR (200)  NULL,
    [DueDate]               DATETIME       NULL,
    [CompletedDate]         DATETIME       NULL,
    [DocumentNumber]        VARCHAR (200)  NULL,
    [DocumentRevision]      VARCHAR (200)  NULL,
    [DocumentTitle]         VARCHAR (8000) NULL,
    [DocumentVersion]       VARCHAR (200)  NULL,
    [InitiatorName]         VARCHAR (200)  NULL,
    [InitiatorId]           VARCHAR (200)  NULL,
    [InitiatorRelationship] VARCHAR (200)  NULL,
    [InitiatorLink]         VARCHAR (200)  NULL,
    [AssigneesId]           VARCHAR (200)  NULL,
    [AssigneesName]         VARCHAR (200)  NULL,
    [AssigneesRelationship] VARCHAR (200)  NULL,
    [AssigneesLink]         VARCHAR (200)  NULL,
    [DateRecordCreated]     DATETIME       DEFAULT (getdate()) NULL,
    [DateRecordUpdated]     DATETIME       DEFAULT (getdate()) NULL
);

