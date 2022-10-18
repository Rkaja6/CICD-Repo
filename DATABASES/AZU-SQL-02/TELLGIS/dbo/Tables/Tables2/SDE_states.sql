CREATE TABLE [dbo].[SDE_states] (
    [state_id]        BIGINT        NOT NULL,
    [owner]           NVARCHAR (32) NOT NULL,
    [creation_time]   DATETIME      NOT NULL,
    [closing_time]    DATETIME      NULL,
    [parent_state_id] BIGINT        NOT NULL,
    [lineage_name]    BIGINT        NOT NULL,
    CONSTRAINT [states_pk] PRIMARY KEY CLUSTERED ([state_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [states_cuk] UNIQUE NONCLUSTERED ([parent_state_id] ASC, [lineage_name] ASC) WITH (FILLFACTOR = 75)
);


GO
CREATE TRIGGER sde_lineage_delete ON dbo.SDE_states FOR DELETE AS      DELETE FROM dbo.SDE_state_lineages WHERE lineage_id IN (SELECT state_id FROM deleted)
GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_states] TO PUBLIC
    AS [dbo];

