CREATE PROCEDURE dbo.SDE_locator_def_insert       @locator_idVal INTEGER,@categoryVal NVARCHAR(32),@typeVal INTEGER,       @descriptionVal NVARCHAR(64), @nameVal NVARCHAR(32),       @ownerVal NVARCHAR(32) AS SET NOCOUNT ON INSERT INTO dbo.SDE_locators      (locator_id,category,type,description,name,owner) VALUES (      @locator_idVal,@categoryVal,@typeVal,@descriptionVal,@nameVal,@ownerVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_locator_def_insert] TO PUBLIC
    AS [dbo];

