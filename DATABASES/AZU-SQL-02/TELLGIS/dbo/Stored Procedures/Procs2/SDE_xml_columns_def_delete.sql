CREATE PROCEDURE dbo.SDE_xml_columns_def_delete
@columnIdVal INTEGER AS SET NOCOUNT ON
BEGIN
DELETE FROM dbo.SDE_xml_columns WHERE column_id =  @columnIdVal
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_xml_columns_def_delete] TO PUBLIC
    AS [dbo];

