






create procedure [RiskMgmt].[Proc_Insert_Person]

-- Add the parameters for the stored procedure here
	@FullName varchar(50)
AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	Declare @LogMessage varchar(1000);

	IF EXISTS (SELECT 1 FROM RiskMgmt.Person WHERE FullName = @FullName) 
	BEGIN
		
		SET @LogMessage = @FullName + ' already exists in the Person table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;
		RAISERROR(@LogMessage, 16, 1) ;
		RETURN 1;
	
	END
	
	ELSE
	BEGIN
		BEGIN TRY

			INSERT INTO [RiskMgmt].[Person]
				(FullName)
			SELECT 
				@FullName;

			SET @LogMessage = 'Added ' + @FullName + ' to Person table.';
			EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;
			RETURN 0;
		
		END TRY

		BEGIN CATCH
		   IF @@trancount > 0 ROLLBACK TRANSACTION; 
		   EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID;
		   RETURN 1;
		END CATCH
	
	END

END