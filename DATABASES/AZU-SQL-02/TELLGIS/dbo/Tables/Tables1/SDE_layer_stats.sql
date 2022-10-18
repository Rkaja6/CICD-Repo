CREATE TABLE [dbo].[SDE_layer_stats] (
    [oid]            INT        IDENTITY (1, 1) NOT NULL,
    [layer_id]       INT        NOT NULL,
    [version_id]     INT        NULL,
    [minx]           FLOAT (53) NOT NULL,
    [miny]           FLOAT (53) NOT NULL,
    [maxx]           FLOAT (53) NOT NULL,
    [maxy]           FLOAT (53) NOT NULL,
    [minz]           FLOAT (53) NULL,
    [minm]           FLOAT (53) NULL,
    [maxz]           FLOAT (53) NULL,
    [maxm]           FLOAT (53) NULL,
    [total_features] INT        NOT NULL,
    [total_points]   INT        NOT NULL,
    [last_analyzed]  DATETIME   NOT NULL,
    CONSTRAINT [sdelayer_stats_pk] PRIMARY KEY CLUSTERED ([oid] ASC),
    CONSTRAINT [sdelayer_stats_fk1] FOREIGN KEY ([layer_id]) REFERENCES [dbo].[SDE_layers] ([layer_id]) ON DELETE CASCADE,
    CONSTRAINT [sdelayer_stats_fk2] FOREIGN KEY ([version_id]) REFERENCES [dbo].[SDE_versions] ([version_id]) ON DELETE CASCADE,
    CONSTRAINT [sdelayer_stats_uk] UNIQUE NONCLUSTERED ([layer_id] ASC, [version_id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_layer_stats] TO PUBLIC
    AS [dbo];

