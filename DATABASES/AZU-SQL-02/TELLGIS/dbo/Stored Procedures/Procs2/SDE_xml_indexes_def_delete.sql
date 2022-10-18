CREATE PROCEDURE dbo.SDE_xml_indexes_def_delete
@ownerVal NVARCHAR(32),@indexNameVal NVARCHAR(64) AS
SET NOCOUNT ON BEGIN
BEGIN TRAN xml_index_del
-- Delete index record. Cascading constraint will delete from dbo.SDE_xml_index_tags 
DELETE FROM dbo.SDE_xml_indexes
  WHERE owner = @ownerVal AND index_name = @indexNameVal
COMMIT TRAN xml_index_del
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_xml_indexes_def_delete] TO PUBLIC
    AS [dbo];

