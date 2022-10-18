CREATE TABLE [dbo].[SDE_dbtune] (
    [keyword]        NVARCHAR (32)   NOT NULL,
    [parameter_name] NVARCHAR (32)   NOT NULL,
    [config_string]  NVARCHAR (2048) NULL,
    CONSTRAINT [dbtune_pk] PRIMARY KEY CLUSTERED ([keyword] ASC, [parameter_name] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_dbtune] TO PUBLIC
    AS [dbo];

