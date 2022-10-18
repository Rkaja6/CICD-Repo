CREATE TABLE [dbo].[SDE_geometry_columns] (
    [f_table_catalog]   NVARCHAR (32) NOT NULL,
    [f_table_schema]    NVARCHAR (32) NOT NULL,
    [f_table_name]      [sysname]     NOT NULL,
    [f_geometry_column] NVARCHAR (32) NOT NULL,
    [g_table_catalog]   NVARCHAR (32) NULL,
    [g_table_schema]    NVARCHAR (32) NOT NULL,
    [g_table_name]      [sysname]     NOT NULL,
    [storage_type]      INT           NULL,
    [geometry_type]     INT           NULL,
    [coord_dimension]   INT           NULL,
    [max_ppr]           INT           NULL,
    [srid]              INT           NOT NULL,
    CONSTRAINT [geocol_pk] PRIMARY KEY CLUSTERED ([f_table_catalog] ASC, [f_table_schema] ASC, [f_table_name] ASC, [f_geometry_column] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [geocol_fk] FOREIGN KEY ([srid]) REFERENCES [dbo].[SDE_spatial_references] ([srid])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_geometry_columns] TO PUBLIC
    AS [dbo];

