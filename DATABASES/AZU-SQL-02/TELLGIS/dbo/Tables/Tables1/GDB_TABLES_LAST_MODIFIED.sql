CREATE TABLE [dbo].[GDB_TABLES_LAST_MODIFIED] (
    [table_name]          NVARCHAR (160) NOT NULL,
    [last_modified_count] INT            NOT NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [GDB_LMODIFIED_IX1]
    ON [dbo].[GDB_TABLES_LAST_MODIFIED]([table_name] ASC);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDB_TABLES_LAST_MODIFIED] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDB_TABLES_LAST_MODIFIED] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDB_TABLES_LAST_MODIFIED] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDB_TABLES_LAST_MODIFIED] TO PUBLIC
    WITH GRANT OPTION
    AS [dbo];

