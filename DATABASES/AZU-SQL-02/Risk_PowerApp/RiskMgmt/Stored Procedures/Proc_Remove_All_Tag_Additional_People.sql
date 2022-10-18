








create procedure [RiskMgmt].[Proc_Remove_All_Tag_Additional_People]

-- Add the parameters for the stored procedure here

	@RiskID int

AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	Declare @LogMessage varchar(1000);
	Declare @PersonID int;

	BEGIN
		BEGIN TRY

			DELETE FROM [RiskMgmt].[Tag_Additional_People]
			WHERE RiskID = @RiskID
		
			SET @LogMessage = 'Removed all additional people from RiskID ' + ltrim(str(@RiskID)) + '.';
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