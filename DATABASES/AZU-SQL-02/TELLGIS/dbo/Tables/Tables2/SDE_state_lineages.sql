CREATE TABLE [dbo].[SDE_state_lineages] (
    [lineage_name] BIGINT NOT NULL,
    [lineage_id]   BIGINT NOT NULL,
    CONSTRAINT [state_lineages_pk] PRIMARY KEY CLUSTERED ([lineage_name] ASC, [lineage_id] ASC) WITH (FILLFACTOR = 75)
);


GO
CREATE NONCLUSTERED INDEX [lineage_id_idx2]
    ON [dbo].[SDE_state_lineages]([lineage_id] ASC) WITH (FILLFACTOR = 75);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_state_lineages] TO PUBLIC
    AS [dbo];

