CREATE TABLE [dbo].[SDE_state_locks] (
    [sde_id]    INT      NOT NULL,
    [state_id]  BIGINT   NOT NULL,
    [autolock]  CHAR (1) NOT NULL,
    [lock_type] CHAR (1) NOT NULL,
    [lock_time] DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [state_locks_pk] PRIMARY KEY CLUSTERED ([sde_id] ASC, [state_id] ASC, [autolock] ASC, [lock_type] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_state_locks] TO PUBLIC
    AS [dbo];

