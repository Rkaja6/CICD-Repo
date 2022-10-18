CREATE TABLE [dbo].[SDE_layer_locks] (
    [sde_id]    INT      NOT NULL,
    [layer_id]  INT      NOT NULL,
    [autolock]  CHAR (1) NOT NULL,
    [lock_type] CHAR (1) NOT NULL,
    [lock_time] DATETIME DEFAULT (getdate()) NOT NULL,
    [minx]      BIGINT   NULL,
    [miny]      BIGINT   NULL,
    [maxx]      BIGINT   NULL,
    [maxy]      BIGINT   NULL,
    CONSTRAINT [layer_locks_pk] PRIMARY KEY CLUSTERED ([sde_id] ASC, [layer_id] ASC, [autolock] ASC, [lock_type] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_layer_locks] TO PUBLIC
    AS [dbo];

