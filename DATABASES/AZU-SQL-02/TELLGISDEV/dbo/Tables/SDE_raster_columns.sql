CREATE TABLE [dbo].[SDE_raster_columns] (
    [rastercolumn_id]      INT           NOT NULL,
    [description]          NVARCHAR (65) NULL,
    [database_name]        NVARCHAR (32) NOT NULL,
    [owner]                NVARCHAR (32) NOT NULL,
    [table_name]           [sysname]     NOT NULL,
    [raster_column]        NVARCHAR (32) NOT NULL,
    [cdate]                INT           NOT NULL,
    [config_keyword]       NVARCHAR (32) NULL,
    [minimum_id]           INT           NULL,
    [base_rastercolumn_id] INT           NOT NULL,
    [rastercolumn_mask]    INT           NOT NULL,
    [srid]                 INT           NULL,
    CONSTRAINT [rascol_pk] PRIMARY KEY CLUSTERED ([database_name] ASC, [owner] ASC, [table_name] ASC, [raster_column] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [rascol_fk] FOREIGN KEY ([srid]) REFERENCES [dbo].[SDE_spatial_references] ([srid]),
    CONSTRAINT [rascol_uk] UNIQUE NONCLUSTERED ([rastercolumn_id] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_raster_columns] TO PUBLIC
    AS [dbo];

