








create procedure [RiskMgmt].[Proc_Update_History_Action]

-- Add the parameters for the stored procedure here
	@DebugMode int = 0,
	@RiskID int,
	@ActionDate datetime2,
	@ActionBy varchar(50),
	@ActionDesc varchar(20),
	@Attribrute varchar(50) =  null,
	@HistoryTable varchar(20) = null,
	@HistoryTableID int = null,
	@ActionComment varchar(1000) = null

AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	IF @DebugMode = 0
	BEGIN
		
		BEGIN TRY
			INSERT INTO [RiskMgmt].[History_Action]
			   ([RiskID]
				,[ActionDate]
				,[ActionBy]
				,[ActionDesc]
				,[Attribrute]
				,[HistoryTable]
				,[HistoryTableID]
				,[ActionComment])
			VALUES
				(@RiskID,
				@ActionDate,
				@ActionBy,
				@ActionDesc,
				@Attribrute,
				@HistoryTable,
				@HistoryTableID,
				@ActionComment);
			
			RETURN 0;
		END TRY

		BEGIN CATCH
		   IF @@trancount > 0 ROLLBACK TRANSACTION; 
		   EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID;
		   RETURN 1;
		END CATCH
	
	END

END