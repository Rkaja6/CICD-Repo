CREATE TABLE [dbo].[SDE_logfile_pool] (
    [table_id] INT NOT NULL,
    [sde_id]   INT NULL,
    CONSTRAINT [logfile_pool_pk] PRIMARY KEY CLUSTERED ([table_id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_logfile_pool] TO PUBLIC
    AS [dbo];

