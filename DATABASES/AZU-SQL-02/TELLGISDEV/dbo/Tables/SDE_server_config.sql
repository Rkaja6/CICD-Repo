CREATE TABLE [dbo].[SDE_server_config] (
    [prop_name]       NVARCHAR (32)  NOT NULL,
    [char_prop_value] NVARCHAR (512) NULL,
    [num_prop_value]  INT            NULL,
    CONSTRAINT [server_config_pk] PRIMARY KEY CLUSTERED ([prop_name] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_server_config] TO PUBLIC
    AS [dbo];

