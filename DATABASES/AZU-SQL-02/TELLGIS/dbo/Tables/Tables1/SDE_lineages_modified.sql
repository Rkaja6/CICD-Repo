CREATE TABLE [dbo].[SDE_lineages_modified] (
    [lineage_name]       BIGINT   NOT NULL,
    [time_last_modified] DATETIME NOT NULL,
    CONSTRAINT [lineages_mod_pk] PRIMARY KEY CLUSTERED ([lineage_name] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_lineages_modified] TO PUBLIC
    AS [dbo];

