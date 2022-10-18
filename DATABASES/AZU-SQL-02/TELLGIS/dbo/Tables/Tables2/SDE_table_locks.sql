CREATE TABLE [dbo].[SDE_table_locks] (
    [sde_id]          INT      NOT NULL,
    [registration_id] INT      NOT NULL,
    [lock_type]       CHAR (1) NOT NULL,
    [lock_time]       DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [table_locks_pk] PRIMARY KEY CLUSTERED ([sde_id] ASC, [registration_id] ASC, [lock_type] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_table_locks] TO PUBLIC
    AS [dbo];

