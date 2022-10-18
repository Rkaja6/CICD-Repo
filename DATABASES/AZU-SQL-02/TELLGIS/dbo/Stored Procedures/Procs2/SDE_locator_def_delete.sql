CREATE PROCEDURE dbo.SDE_locator_def_delete @id1        INTEGER AS SET NOCOUNT ON DELETE FROM dbo.SDE_locators WHERE locator_id = @id1
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_locator_def_delete] TO PUBLIC
    AS [dbo];

