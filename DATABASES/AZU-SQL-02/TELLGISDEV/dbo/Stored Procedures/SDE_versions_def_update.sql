CREATE PROCEDURE dbo.SDE_versions_def_update        @statusVal INTEGER, @descVal NVARCHAR(64), @nameVal NVARCHAR(64),        @ownerVal NVARCHAR(32) AS SET NOCOUNT ON UPDATE dbo.SDE_versions SET status = @statusVal,        description = @descVal WHERE name = @nameVal and owner = @ownerVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_versions_def_update] TO PUBLIC
    AS [dbo];

