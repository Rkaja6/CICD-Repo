CREATE PROCEDURE dbo.SDE_generator_release AS SELECT 4 FROM dbo.SDE_version
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_generator_release] TO PUBLIC
    AS [dbo];

