CREATE TABLE [dbo].[SDE_branch_tables_modified] (
    [branch_id]       INT           NOT NULL,
    [registration_id] INT           NOT NULL,
    [edit_moment]     DATETIME2 (7) NOT NULL,
    CONSTRAINT [btm_pk] PRIMARY KEY CLUSTERED ([branch_id] ASC, [registration_id] ASC, [edit_moment] ASC),
    CONSTRAINT [btm_fk] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[SDE_branches] ([branch_id]) ON DELETE CASCADE
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_branch_tables_modified] TO PUBLIC
    AS [dbo];

