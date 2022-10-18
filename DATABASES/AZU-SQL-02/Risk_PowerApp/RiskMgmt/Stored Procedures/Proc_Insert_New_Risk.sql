










create procedure [RiskMgmt].[Proc_Insert_New_Risk]

-- Add the parameters for the stored procedure here

	@Title varchar(200), 
	@Description varchar(1000),
	@Category varchar(50),
	@RiskGroup varchar(50),
	@Response varchar(20),
	@Type varchar(20),
	@Opportunity_Flag varchar (1),
	@Cost_Flag varchar(1),
	@Schedule_Flag varchar(1),
	@HSE_Flag varchar(1),
	@OwnerFullName varchar(50),
	@Impact int, 
	@Likelihood int,
	@Status varchar(20),
	@ActionTime datetime2,
	@UserName varchar(50),
	@Comment varchar(1000) = null

AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	Declare 
		@LogMessage varchar(1000),
		@PersonID int,
		@RiskID int;

	BEGIN TRY
		SELECT @PersonID = PersonID from RiskMgmt.Person where FullName = @OwnerFullName;

		INSERT INTO [RiskMgmt].[Risk]
			   ([Title]
			   ,[Description]
			   ,[Category]
			   ,[RiskGroup]
			   ,[Response]
			   ,[Type]
			   ,[Opportunity_Flag]
			   ,[Owner_PersonID]
			   --,[Related_Project]
			   --,[ProjectID]
			   ,[Cost_Flag]
			   ,[Schedule_Flag]
			   ,[HSE_Flag])
		VALUES 
			(
			@Title,
			@Description,
			@Category,
			@RiskGroup,
			@Response,
			@Type,
			@Opportunity_Flag,
			@PersonID,
			@Cost_Flag,
			@Schedule_Flag,
			@HSE_Flag
			);
		
		SELECT @RiskID = SCOPE_IDENTITY();

		SELECT @LogMessage = 'Added New Risk ' + @Title + ' to Risk table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;
		
		EXEC [RiskMgmt].[Proc_Update_History_Impact] 
			@NewRisk = 1,
			@RiskID = @RiskID,
			@Impact = @Impact,
			@ActionTime = @ActionTime;
		
		SELECT @LogMessage = 'Added New Risk ' + @Title + ' to History_Impact table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;

		EXEC [RiskMgmt].[Proc_Update_History_Likelihood]
			@NewRisk = 1,
			@RiskID = @RiskID,
			@Likelihood = @Likelihood,
			@ActionTime = @ActionTime;

		SELECT @LogMessage = 'Added New Risk ' + @Title + ' to History_Likelihood table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;

		EXEC [RiskMgmt].[Proc_Update_History_Status]
			@NewRisk = 1,
			@RiskID = @RiskID,
			@Status = @Status,
			@ActionTime = @ActionTime;

		SELECT @LogMessage = 'Adding New Risk ' + @Title + ' to History_Status table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;

		EXEC [RiskMgmt].[Proc_Update_History_Action] 
			@RiskID = @RiskID, 
			@ActionDate = @ActionTime,
			@ActionBy = @UserName,
			@ActionDesc = 'New Risk'

		IF @Comment IS NOT NULL
			EXEC [RiskMgmt].[Proc_Update_History_Action]
				@RiskID = @RiskID, 
				@ActionDate = @ActionTime,
				@ActionBy = @UserName,
				@ActionDesc = 'Add Comment',
				@ActionComment = @Comment

		RETURN 0;

	END TRY

	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION; 
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID;
		RETURN 1;
	END CATCH

END