CREATE PROCEDURE dbo.SDE_locator_def_update @locator_idVal INTEGER,      @categoryVal NVARCHAR(32), @typeVal INTEGER, @descriptionVal NVARCHAR(64),      @nameVal NVARCHAR(32) AS SET NOCOUNT ON      UPDATE dbo.SDE_locators SET name = @nameVal, category = @categoryVal,type = @typeVal,      description = @descriptionVal WHERE locator_id = @locator_idVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_locator_def_update] TO PUBLIC
    AS [dbo];

