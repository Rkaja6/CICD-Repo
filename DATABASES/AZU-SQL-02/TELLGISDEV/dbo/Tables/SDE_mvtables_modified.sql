CREATE TABLE [dbo].[SDE_mvtables_modified] (
    [state_id]        BIGINT NOT NULL,
    [registration_id] INT    NOT NULL,
    CONSTRAINT [mvtables_modified_pk] PRIMARY KEY CLUSTERED ([state_id] ASC, [registration_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [mvtables_modified_fk1] FOREIGN KEY ([state_id]) REFERENCES [dbo].[SDE_states] ([state_id]),
    CONSTRAINT [mvtables_modified_fk2] FOREIGN KEY ([registration_id]) REFERENCES [dbo].[SDE_table_registry] ([registration_id])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_mvtables_modified] TO PUBLIC
    AS [dbo];

