CREATE PROCEDURE dbo.SDE_xml_indexes_def_update
@index_id INTEGER, @indexNameVal NVARCHAR(32),
@descriptionVal NVARCHAR(64)
AS SET NOCOUNT ON
BEGIN
  UPDATE dbo.SDE_xml_indexes
   SET index_name = @indexNameVal, description = @descriptionVal
   WHERE index_id = @index_id
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_xml_indexes_def_update] TO PUBLIC
    AS [dbo];

