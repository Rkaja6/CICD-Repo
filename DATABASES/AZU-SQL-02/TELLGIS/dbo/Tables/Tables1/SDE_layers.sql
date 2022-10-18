CREATE TABLE [dbo].[SDE_layers] (
    [layer_id]           INT            NOT NULL,
    [description]        NVARCHAR (65)  NULL,
    [database_name]      NVARCHAR (128) NOT NULL,
    [table_name]         [sysname]      NOT NULL,
    [owner]              NVARCHAR (128) NOT NULL,
    [spatial_column]     NVARCHAR (128) NOT NULL,
    [eflags]             INT            NOT NULL,
    [layer_mask]         INT            NOT NULL,
    [gsize1]             FLOAT (53)     NOT NULL,
    [gsize2]             FLOAT (53)     NOT NULL,
    [gsize3]             FLOAT (53)     NOT NULL,
    [minx]               FLOAT (53)     NOT NULL,
    [miny]               FLOAT (53)     NOT NULL,
    [maxx]               FLOAT (53)     NOT NULL,
    [maxy]               FLOAT (53)     NOT NULL,
    [minz]               FLOAT (53)     NULL,
    [maxz]               FLOAT (53)     NULL,
    [minm]               FLOAT (53)     NULL,
    [maxm]               FLOAT (53)     NULL,
    [cdate]              INT            NOT NULL,
    [layer_config]       NVARCHAR (32)  NULL,
    [optimal_array_size] INT            NULL,
    [stats_date]         INT            NULL,
    [minimum_id]         INT            NULL,
    [srid]               INT            NOT NULL,
    [base_layer_id]      INT            NOT NULL,
    [secondary_srid]     INT            NULL,
    CONSTRAINT [layers_pk] PRIMARY KEY CLUSTERED ([database_name] ASC, [table_name] ASC, [owner] ASC, [spatial_column] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [layers_fk] FOREIGN KEY ([srid]) REFERENCES [dbo].[SDE_spatial_references] ([srid]),
    CONSTRAINT [layers_sfk] FOREIGN KEY ([secondary_srid]) REFERENCES [dbo].[SDE_spatial_references] ([srid]),
    CONSTRAINT [layers_uk] UNIQUE NONCLUSTERED ([layer_id] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_layers] TO PUBLIC
    AS [dbo];

