CREATE PROCEDURE dbo.SDE_dbtune_def_update       @keywordVal NVARCHAR(32),@parameter_nameVal NVARCHAR(32),       @config_stringVal NVARCHAR(2048) AS UPDATE dbo.SDE_dbtune       SET  config_string = @config_stringVal WHERE       keyword = @keywordVal AND parameter_name = @parameter_nameVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_dbtune_def_update] TO PUBLIC
    AS [dbo];

