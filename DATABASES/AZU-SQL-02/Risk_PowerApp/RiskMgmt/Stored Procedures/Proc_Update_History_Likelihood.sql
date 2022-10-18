





create procedure [RiskMgmt].[Proc_Update_History_Likelihood]
	@NewRisk int,
	@RiskID int,
	@Likelihood int, 
	@ActionTime datetime2
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
		IF @NewRisk = 1
		BEGIN
			INSERT INTO [RiskMgmt].[History_Likelihood]
					   ([RiskID]
					   ,[StartDate]
					   ,Likelihood
					   ,[Initial_Value_Flag])
				 VALUES
					   (
					   @RiskID,
					   @ActionTime
					   ,@Likelihood
					   ,'Y'
					   );
			RETURN 0;
		END

		ELSE 
		BEGIN
					
			UPDATE [RiskMgmt].[History_Likelihood]
			SET EndDate = DATEADD(SS,-1,@ActionTime)
			WHERE EndDate IS NULL AND RiskID = @RiskID;

			INSERT INTO [RiskMgmt].[History_Likelihood]
					   ([RiskID]
					   ,[StartDate]
					   ,Likelihood
					   ,[Initial_Value_Flag])
				 VALUES
					   (
					   @RiskID,
					   @ActionTime,
					   @Likelihood,
					   'N'
					   );
			RETURN 0;
		END 
	END TRY

	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION; 
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID;
		RETURN 1;
	END CATCH

END