CREATE TABLE [dbo].[SDE_table_registry] (
    [registration_id]   INT            NOT NULL,
    [database_name]     NVARCHAR (32)  NULL,
    [table_name]        [sysname]      NOT NULL,
    [owner]             NVARCHAR (32)  NOT NULL,
    [rowid_column]      NVARCHAR (32)  NULL,
    [description]       NVARCHAR (65)  NULL,
    [object_flags]      INT            NOT NULL,
    [registration_date] INT            NOT NULL,
    [config_keyword]    NVARCHAR (32)  NULL,
    [minimum_id]        INT            NULL,
    [imv_view_name]     NVARCHAR (128) NULL,
    CONSTRAINT [registry_pk] PRIMARY KEY CLUSTERED ([registration_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [registry_chk] CHECK ([database_name]=db_name()),
    CONSTRAINT [registry_uk2] UNIQUE NONCLUSTERED ([table_name] ASC, [owner] ASC, [database_name] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_table_registry] TO PUBLIC
    AS [dbo];

