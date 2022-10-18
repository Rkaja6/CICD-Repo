CREATE TABLE [dbo].[SDE_object_locks] (
    [sde_id]         INT      NOT NULL,
    [object_id]      INT      NOT NULL,
    [object_type]    INT      NOT NULL,
    [application_id] INT      NOT NULL,
    [autolock]       CHAR (1) NOT NULL,
    [lock_type]      CHAR (1) NOT NULL,
    [lock_time]      DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [object_locks_pk] PRIMARY KEY CLUSTERED ([sde_id] ASC, [object_id] ASC, [object_type] ASC, [application_id] ASC, [autolock] ASC, [lock_type] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_object_locks] TO PUBLIC
    AS [dbo];

