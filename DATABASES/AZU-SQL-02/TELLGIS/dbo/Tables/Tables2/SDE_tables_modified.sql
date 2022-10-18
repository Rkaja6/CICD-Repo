CREATE TABLE [dbo].[SDE_tables_modified] (
    [table_name]         [sysname] NOT NULL,
    [time_last_modified] DATETIME  NOT NULL,
    CONSTRAINT [tables_modified_pk] PRIMARY KEY CLUSTERED ([table_name] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_tables_modified] TO PUBLIC
    AS [dbo];

