

CREATE PROCEDURE [dbo].[ProcessUploadedDocuments] AS
BEGIN
	SET NOCOUNT ON
	EXEC MergeBechtelUploads
	EXEC MergeTellurianUploads
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ProcessUploadedDocuments] TO [DWLNG_App]
    AS [dbo];

