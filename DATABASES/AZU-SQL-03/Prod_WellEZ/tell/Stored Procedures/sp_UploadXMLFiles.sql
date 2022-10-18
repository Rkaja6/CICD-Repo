



CREATE PROCEDURE [tell].[sp_UploadXMLFiles]
AS
BEGIN
DECLARE @FileName nvarchar(200)

WHILE 
	(
	(SELECT COUNT(*) FROM tell.XMLFiles WHERE InsertedDate IS NULL) > 0
	)
BEGIN
	SELECT TOP 1 @FileName = FullPath FROM tell.XMLFiles WHERE InsertedDate IS NULL
	BEGIN TRY
		BEGIN TRANSACTION [sp_UploadXMLFiles]
			EXEC [dbo].[sp_ImportXML] @FileName = @FileName;
			UPDATE tell.XMLFiles SET InsertedDate = GETDATE() where FullPath = @FileName;
		COMMIT TRANSACTION [sp_UploadXMLFiles]
	END TRY

	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRANSACTION [sp_UploadXMLFiles];
		THROW;
	END CATCH

END

END