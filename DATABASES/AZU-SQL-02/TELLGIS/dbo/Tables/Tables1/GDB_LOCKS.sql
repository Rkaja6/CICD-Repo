CREATE TABLE [dbo].[GDB_LOCKS] (
    [objectid]        INT              NOT NULL,
    [branch_id]       INT              NULL,
    [registration_id] INT              NULL,
    [type]            INT              NOT NULL,
    [user_identity]   NVARCHAR (255)   NULL,
    [session_id]      UNIQUEIDENTIFIER NOT NULL,
    [lock_time]       DATETIME2 (7)    NULL,
    [lock_duration]   INT              NULL,
    [base_id]         INT              NULL,
    [num_ids]         INT              NULL,
    [service_name]    NVARCHAR (512)   NULL,
    [can_post]        SMALLINT         NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GDB_Locks_cond_idx]
    ON [dbo].[GDB_LOCKS]([branch_id] ASC) WHERE ([type]=(2));


GO
CREATE NONCLUSTERED INDEX [gdb_locks_ix1]
    ON [dbo].[GDB_LOCKS]([branch_id] ASC, [session_id] ASC, [registration_id] ASC) WITH (FILLFACTOR = 75);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R10_SDE_ROWID_UK]
    ON [dbo].[GDB_LOCKS]([objectid] ASC) WITH (FILLFACTOR = 75);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDB_LOCKS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDB_LOCKS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDB_LOCKS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDB_LOCKS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];

