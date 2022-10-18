CREATE PROCEDURE dbo.SDE_archives_def_delete
@archivingRegIdVal INTEGER AS SET NOCOUNT ON
BEGIN
DELETE FROM dbo.SDE_archives WHERE archiving_regid =  @archivingRegIdVal
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_archives_def_delete] TO PUBLIC
    AS [dbo];

