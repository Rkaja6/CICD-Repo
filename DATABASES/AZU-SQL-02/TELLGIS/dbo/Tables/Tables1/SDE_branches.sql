CREATE TABLE [dbo].[SDE_branches] (
    [name]                  NVARCHAR (64)    NOT NULL,
    [owner]                 NVARCHAR (255)   NOT NULL,
    [description]           NVARCHAR (64)    NULL,
    [status]                INT              NOT NULL,
    [creation_time]         DATETIME2 (7)    CONSTRAINT [creation_time_def] DEFAULT (CONVERT([datetime2](3),getutcdate())) NOT NULL,
    [branch_id]             INT              IDENTITY (0, 1) NOT NULL,
    [branch_moment]         DATETIME2 (7)    CONSTRAINT [branch_moment_def] DEFAULT (CONVERT([datetime2](3),getutcdate())) NOT NULL,
    [ancestor_moment]       DATETIME2 (7)    CONSTRAINT [ancestor_moment_def] DEFAULT (CONVERT([datetime2](3),getutcdate())) NOT NULL,
    [last_reconcile_moment] DATETIME2 (7)    NULL,
    [validation_moment]     DATETIME2 (7)    NULL,
    [service_name]          NVARCHAR (512)   NULL,
    [branch_guid]           UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [br_pk] PRIMARY KEY CLUSTERED ([branch_id] ASC),
    CONSTRAINT [br_uk] UNIQUE NONCLUSTERED ([owner] ASC, [name] ASC, [service_name] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [branch_bg_uk]
    ON [dbo].[SDE_branches]([branch_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [branch_sn_idx]
    ON [dbo].[SDE_branches]([service_name] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_branches] TO PUBLIC
    AS [dbo];

