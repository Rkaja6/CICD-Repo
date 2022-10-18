

/************************************************************
** Name: ProcessWorkflowJSON
** Desc: 
** Auth: Aaron Vogt
** Date: 02/08/2020
**************************
** Change History
**************************
** PR Date         Author         Description 
** -- ----         ------         -------------------------------------------
** 1  02/08/2020   Aaron          Object creation
************************************************************/
CREATE PROCEDURE [dbo].[ProcessWorkflowJSON]
	@WorkflowJSON VARCHAR(MAX), 
	@ProjectId INT = NULL
AS
BEGIN
MERGE dbo.Workflow AS Destination
USING
(
SELECT 
	(SELECT TOP 1 ProjectShortName FROM dbo.Projects WHERE ProjectId = @ProjectId) AS ProjectShortName,
	JSON_VALUE(value, '$.workflow.number') AS WorkflowNumber,
	JSON_VALUE(value, '$.workflow.name') AS WorkflowName,
	JSON_VALUE(value, '$.status') AS Status,
	JSON_VALUE(value, '$.name') AS StepName,
	CONVERT(DATETIME, JSON_VALUE(value, '$.dueDate')) AS DueDate,
	CONVERT(DATETIME, JSON_VALUE(value, '$.completedDate')) AS CompletedDate,
	JSON_VALUE(value, '$.document.number') AS DocumentNumber,
	JSON_VALUE(value, '$.document.revision') AS DocumentRevision,
	JSON_VALUE(value, '$.document.title') AS DocumentTitle,
	JSON_VALUE(value, '$.document.version') AS DocumentVersion,
	(SELECT TOP 1 UserName FROM Directory WHERE UserId = JSON_VALUE(value, '$.initiator.id')) AS InitiatorName,
	JSON_VALUE(value, '$.initiator.id') AS InitiatorId,
	(SELECT TOP 1 JSON_VALUE(b.VALUE, '$.rel') FROM OPENJSON(a.VALUE, '$.initiator.links') b) AS InitiatorRelationship,
	(SELECT TOP 1 JSON_VALUE(b.VALUE, '$.href') FROM OPENJSON(a.VALUE, '$.initiator.links') b) AS InitiatorLink,
	(SELECT TOP 1 UserName FROM Directory WHERE UserId = (SELECT TOP 1 JSON_VALUE(b.VALUE, '$.id') FROM OPENJSON(a.VALUE, '$."assignees"') b)) AS AssigneesName,
	--TO DO:  We need to extend the data model to support multiple assignees and initators
	(SELECT TOP 1 JSON_VALUE(b.VALUE, '$.id') FROM OPENJSON(a.VALUE, '$."assignees"') b) AS AssigneesId,
	JSON_VALUE((SELECT TOP 1 c.VALUE FROM OPENJSON((SELECT TOP 1 b.VALUE FROM OPENJSON(a.VALUE, '$."assignees"') b), '$."links"') c), '$.rel') AS AssigneesRelationship,
	JSON_VALUE((SELECT TOP 1 c.VALUE FROM OPENJSON((SELECT TOP 1 b.VALUE FROM OPENJSON(a.VALUE, '$."assignees"') b), '$."links"') c), '$.href') AS AssigneesLink
FROM OPENJSON(@workflowJSON, '$.reviewResults') a
) AS Source
ON
	Destination.ProjectShortName = Source.ProjectShortName AND
	Destination.WorkflowNumber = Source.WorkflowNumber AND
	Destination.DocumentNumber = Source.DocumentNumber AND
	Destination.DocumentRevision = Source.DocumentRevision AND
	Destination.DocumentVersion = Source.DocumentVersion AND
	Destination.StepName = Source.StepName
WHEN NOT MATCHED THEN
INSERT
(
	ProjectShortName,
	WorkflowNumber,
	WorkflowName,
	Status,
	StepName,
	DueDate,
	CompletedDate,
	DocumentNumber,
	DocumentRevision,
	DocumentTitle,
	DocumentVersion,
	InitiatorName,
	InitiatorId,
	InitiatorRelationship,
	InitiatorLink,
	AssigneesName,
	AssigneesId,
	AssigneesRelationship,
	AssigneesLink
)
VALUES
(
	Source.ProjectShortName,
	Source.WorkflowNumber,
	Source.WorkflowName,
	Source.Status,
	Source.StepName,
	Source.DueDate,
	Source.CompletedDate,
	Source.DocumentNumber,
	Source.DocumentRevision,
	Source.DocumentTitle,
	Source.DocumentVersion,
	Source.InitiatorName,
	Source.InitiatorId,
	Source.InitiatorRelationship,
	Source.InitiatorLink,
	Source.AssigneesName,
	Source.AssigneesId,
	Source.AssigneesRelationship,
	Source.AssigneesLink
)
WHEN MATCHED THEN
UPDATE
SET
	Destination.ProjectShortName = Source.ProjectShortName,
	Destination.WorkflowNumber = Source.WorkflowNumber,
	Destination.WorkflowName = Source.WorkflowName,
	Destination.Status = Source.Status,
	Destination.StepName = Source.StepName,
	Destination.DueDate = Source.DueDate,
	Destination.CompletedDate = Source.CompletedDate,
	Destination.DocumentNumber = Source.DocumentNumber,
	Destination.DocumentRevision = Source.DocumentRevision,
	Destination.DocumentTitle = Source.DocumentTitle,
	Destination.DocumentVersion = Source.DocumentVersion,
	Destination.InitiatorId = Source.InitiatorId,
	Destination.InitiatorRelationship = Source.InitiatorRelationship,
	Destination.InitiatorLink = Source.InitiatorLink,
	Destination.AssigneesId = Source.AssigneesId,
	Destination.AssigneesRelationship = Source.AssigneesRelationship,
	Destination.AssigneesLink = Source.AssigneesLink,
	Destination.DateRecordUpdated = GETDATE();

END