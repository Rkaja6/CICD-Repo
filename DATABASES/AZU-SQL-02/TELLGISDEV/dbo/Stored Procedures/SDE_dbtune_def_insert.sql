﻿CREATE PROCEDURE dbo.SDE_dbtune_def_insert       @keywordVal NVARCHAR(32),@parameter_nameVal NVARCHAR(32),       @config_stringVal NVARCHAR(2048) AS INSERT INTO dbo.SDE_dbtune       (keyword,parameter_name,config_string) VALUES       (@keywordVal,@parameter_nameVal,@config_stringVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_dbtune_def_insert] TO PUBLIC
    AS [dbo];

