CREATE TABLE [dbo].[SDE_column_registry] (
    [database_name]  NVARCHAR (32) NOT NULL,
    [table_name]     [sysname]     NOT NULL,
    [owner]          NVARCHAR (32) NOT NULL,
    [column_name]    NVARCHAR (32) NOT NULL,
    [sde_type]       INT           NOT NULL,
    [column_size]    INT           NULL,
    [decimal_digits] INT           NULL,
    [description]    NVARCHAR (65) NULL,
    [object_flags]   INT           NOT NULL,
    [object_id]      INT           NULL,
    CONSTRAINT [colregistry_pk] PRIMARY KEY CLUSTERED ([database_name] ASC, [table_name] ASC, [owner] ASC, [column_name] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [colregistry_fk] FOREIGN KEY ([table_name], [owner], [database_name]) REFERENCES [dbo].[SDE_table_registry] ([table_name], [owner], [database_name]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_column_registry] TO PUBLIC
    AS [dbo];

