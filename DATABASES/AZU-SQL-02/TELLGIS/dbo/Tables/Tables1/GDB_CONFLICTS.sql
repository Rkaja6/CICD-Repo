CREATE TABLE [dbo].[GDB_CONFLICTS] (
    [branch_id]       INT             NOT NULL,
    [registration_id] INT             NOT NULL,
    [objectid]        INT             NOT NULL,
    [conflict_type]   INT             NOT NULL,
    [branch_moment]   DATETIME2 (7)   NOT NULL,
    [default_moment]  DATETIME2 (7)   NOT NULL,
    [inspected]       VARCHAR (1)     NULL,
    [description]     NVARCHAR (4000) NULL
);


GO
CREATE NONCLUSTERED INDEX [GDB_Conflicts_idx]
    ON [dbo].[GDB_CONFLICTS]([branch_id] ASC, [objectid] ASC) WITH (FILLFACTOR = 75);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDB_CONFLICTS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDB_CONFLICTS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDB_CONFLICTS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDB_CONFLICTS] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];

