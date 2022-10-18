






create procedure [RiskMgmt].[Proc_AppController]

-- Add the parameters for the stored procedure here
	@Command varchar(20),
	@UserName varchar(50) = null,
	@RiskID int = null,
	@Text01 varchar(50) = null,
	@Text02 varchar(50) = null,
	@Text03 varchar(50) = null,
	@Text04 varchar(50) = null,
	@Text05 varchar(50) = null,
	@Text06 varchar(50) = null,
	@Text07 varchar(50) = null,
	@Text08 varchar(50) = null,
	@Text09 varchar(50) = null,
	@Text10 varchar(50) = null,
	@Text11 varchar(50) = null,
	@Text12 varchar(50) = null,
	@Text13 varchar(50) = null,
	@Text14 varchar(50) = null,
	@Text15 varchar(50) = null,
	@Text16 varchar(50) = null,
	@Text17 varchar(50) = null,
	@Text18 varchar(50) = null,
	@Text19 varchar(50) = null,
	@Text20 varchar(50) = null,
	@Title varchar(200) = null,
	@Description varchar(1000) = null,
	@Comment varchar(1000) = null

AS
BEGIN
	
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

DECLARE 
	@ReturnCode int,
	@Debug int,
	@ActionTime datetime2,
	@Category varchar(50),
	@RiskGroup varchar(50),
	@PersonName varchar(50),
	@Type varchar(50),
	@Cost_Flag varchar(1),
	@Schedule_Flag varchar(1),
	@HSE_Flag varchar(1),
	@Opportunity_Flag varchar(1),
	@Impact int,
	@Likelihood int;
	
SELECT
	@ReturnCode = 0, 
	@Debug = 0; -- Change this to 1 when doing development work & testing, this turns off [RiskMgmt].[Proc_Update_History_Action]

IF @Command = 'NewRisk'
BEGIN
	IF @Text01 = '(Add New Category)'
		SELECT @Category = @Text02	
	ELSE
		SELECT @Category = @Text01
			
	IF @Text03 = '(Add New Risk Group)'
		SELECT @RiskGroup = @Text04
	ELSE
		SELECT @RiskGroup = @Text03

	IF @Text07 = '(Add New Person)'
	BEGIN
		SELECT @PersonName = @Text08
		EXEC @ReturnCode = [RiskMgmt].[Proc_Insert_Person] @FullName = @PersonName
	END
	ELSE
		SELECT @PersonName = @Text07

	IF @Text15 = '(Add New Type)'
		SELECT @Type = @Text16
	ELSE
		SELECT @Type = @Text15
		
	IF @Text09 = 'true'
		SELECT @Cost_Flag = 'Y'
	ELSE
		SELECT @Cost_Flag = 'N'
		
	IF @Text10 = 'true'
		SELECT @Schedule_Flag = 'Y'
	ELSE
		SELECT @Schedule_Flag = 'N'

	IF @Text11 = 'true'
		SELECT @HSE_Flag = 'Y'
	ELSE
		SELECT @HSE_Flag = 'N'

	IF @Text13 = 'true'
		SELECT @Opportunity_Flag = 'Y'
	ELSE
		SELECT @Opportunity_Flag = 'N'

	SELECT @Impact = CAST(@Text05 as Int), @Likelihood = CAST(@Text06 as Int)

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0
		EXEC @ReturnCode = RiskMgmt.Proc_Insert_New_Risk 
			@Title = @Title, 
			@Description = @Description, 
			@Category = @Category,
			@RiskGroup = @RiskGroup,
			@Response = @Text12,
			@Type = @Type,
			@Opportunity_Flag = @Opportunity_Flag,
			@Cost_Flag = @Cost_Flag,
			@Schedule_Flag = @Schedule_Flag,
			@HSE_Flag = @HSE_Flag,
			@OwnerFullName = @PersonName,
			@Impact = @Impact,
			@Likelihood = @Likelihood,
			@Status = @Text14,
			@ActionTime = @ActionTime,
			@UserName = @UserName,
			@Comment = @Comment;
				
END

ELSE IF @Command = 'ChangeRiskAttr'
BEGIN
	IF @Text01 = '(Add New Category)'
		SELECT @Category = @Text02	
	ELSE
		SELECT @Category = @Text01
			
	IF @Text03 = '(Add New Risk Group)'
		SELECT @RiskGroup = @Text04
	ELSE
		SELECT @RiskGroup = @Text03

	IF @Text07 = '(Add New Person)'
	BEGIN
		SELECT @PersonName = @Text08
		EXEC @ReturnCode = [RiskMgmt].[Proc_Insert_Person] @FullName = @PersonName
	END
	ELSE
		SELECT @PersonName = @Text07

	IF @Text15 = '(Add New Type)'
		SELECT @Type = @Text16
	ELSE
		SELECT @Type = @Text15
		
	IF @Text09 = 'true'
		SELECT @Cost_Flag = 'Y'
	ELSE
		SELECT @Cost_Flag = 'N'
		
	IF @Text10 = 'true'
		SELECT @Schedule_Flag = 'Y'
	ELSE
		SELECT @Schedule_Flag = 'N'

	IF @Text11 = 'true'
		SELECT @HSE_Flag = 'Y'
	ELSE
		SELECT @HSE_Flag = 'N'

	IF @Text13 = 'true'
		SELECT @Opportunity_Flag = 'Y'
	ELSE
		SELECT @Opportunity_Flag = 'N'

	SELECT @Impact = CAST(@Text05 as Int), @Likelihood = CAST(@Text06 as Int);

	DECLARE 
		@OldTitle varchar(200),
		@OldDesc varchar(1000),
		@OldCategory varchar(50),
		@OldRiskGroup varchar(50),
		@OldResponse varchar(20),
		@OldOwnerName varchar(50),
		@OldType varchar(50),
		@OldCost_Flag varchar(1),
		@OldScheduleFlag varchar(1),
		@OldHSE_Flag varchar(1),
		@OldOpportunityFlag varchar(1),
		@OldImpact int, 
		@OldLikelihood int, 
		@OldStatus varchar(20),
		@UID int;

	SELECT 
		@OldTitle = Title,
		@OldDesc = Description,
		@OldCategory = Category,
		@OldRiskGroup = RiskGroup,
		@OldResponse = Response,
		@OldOwnerName = OwnerName,
		@OldType = Type,
		@OldCost_Flag = Cost_Flag,
		@OldScheduleFlag = Schedule_Flag,
		@OldHSE_Flag = HSE_Flag,
		@OldOpportunityFlag = Opportunity_Flag,
		@OldImpact = Impact, 
		@OldLikelihood = Likelihood, 
		@OldStatus = [Status] 
	FROM RiskMgmt.V_Risk
	WHERE RiskID = @RiskID;

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0
		EXEC @ReturnCode = RiskMgmt.[Proc_Update_Risk]
			@RiskID = @RiskID, 
			@Title = @Title, 
			@Description = @Description, 
			@Category = @Category,
			@RiskGroup = @RiskGroup,
			@Response = @Text12,
			@Type = @Type,
			@Opportunity_Flag = @Opportunity_Flag,
			@Cost_Flag = @Cost_Flag,
			@Schedule_Flag = @Schedule_Flag,
			@HSE_Flag = @HSE_Flag,
			@OwnerFullName = @PersonName,
			@Impact = @Impact,
			@Likelihood = @Likelihood,
			@Status = @Text14,
			@ActionTime = @ActionTime;
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldTitle <> @Title
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Title'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldDesc <> @Description
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Description'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldCategory <> @Category
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Category'

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldRiskGroup <> @RiskGroup
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'RiskGroup'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldResponse <> @Text12
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Response'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldOwnerName <> @PersonName
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'OwnerName'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldType <> @Type
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Type'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldCost_Flag <> @Cost_Flag
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Cost_Flag'
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldScheduleFlag <> @Schedule_Flag
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Schedule_Flag'

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldHSE_Flag <> @HSE_Flag
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'HSE_Flag'

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldOpportunityFlag <> @Opportunity_Flag
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Opportunity_Flag'

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldImpact <> @Impact
	BEGIN
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Impact] 
			@NewRisk = 0, @RiskID = @RiskID, @Impact = @Impact, @ActionTime = @ActionTime;

		SELECT @UID = ImpactHistoryID FROM RiskMgmt.History_Impact WHERE RiskID = @RiskID AND EndDate IS NULL;

		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Impact', @HistoryTable = 'RiskMgmt.History_Impact', @HistoryTableID = @UID
	END;

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldLikelihood <> @Likelihood
	BEGIN
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Likelihood]
			@NewRisk = 0, @RiskID = @RiskID, @Likelihood = @Likelihood, @ActionTime = @ActionTime;

		SELECT @UID = LikelihoodHistoryID FROM RiskMgmt.History_Likelihood WHERE RiskID = @RiskID AND EndDate IS NULL;

		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Likelihood', @HistoryTable = 'RiskMgmt.History_Likelihood', @HistoryTableID = @UID
	END;

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND @OldStatus <> @Text14
	BEGIN
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Status]
			@NewRisk = 0, @RiskID = @RiskID, @Status = @Text14, @ActionTime = @ActionTime;

		SELECT @UID = StatusHistoryID FROM RiskMgmt.History_Status WHERE RiskID = @RiskID AND EndDate IS NULL;

		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Updated Risk', @Attribrute = 'Status', @HistoryTable = 'RiskMgmt.History_Status', @HistoryTableID = @UID
	END;

	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0 AND LEN(@Comment) > 0
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action]
			@RiskID = @RiskID, @ActionDate = @ActionTime, @ActionBy = @UserName, @ActionDesc = 'Add Comment', @ActionComment = @Comment

END

ELSE IF @Command = 'AddPersonToRisk'
BEGIN
	IF @Text01 = '(Add New Person)'
	BEGIN
		SELECT @PersonName = @Text02
		IF @ReturnCode = 0
			EXEC @ReturnCode = [RiskMgmt].[Proc_Insert_Person] @FullName = @PersonName
	END
		
	ELSE
	BEGIN
		SELECT @PersonName = @Text01
	END
		
	IF @ReturnCode = 0
		EXEC @ReturnCode = [RiskMgmt].[Proc_Insert_Tag_Additional_People] @RiskID = @RiskID, @FullName = @PersonName

	SELECT @ActionTime = SYSDATETIME();			
	IF @ReturnCode = 0
		EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action] 
			@DebugMode = @Debug, 
			@RiskID = @RiskID, 
			@ActionDate = @ActionTime,
			@ActionBy = @UserName,
			@ActionDesc = 'Add Person to Risk',
			@Attribrute = @PersonName
END

ELSE IF @Command = 'RemoveAllPplFromRisk'
BEGIN
	EXEC @ReturnCode = [RiskMgmt].[Proc_Remove_All_Tag_Additional_People] @RiskID =  @RiskID
		
	SELECT @ActionTime = SYSDATETIME();
	IF @ReturnCode = 0
	EXEC @ReturnCode = [RiskMgmt].[Proc_Update_History_Action] 
		@DebugMode = @Debug, 
		@RiskID = @RiskID, 
		@ActionDate = @ActionTime,
		@ActionBy = @UserName,
		@ActionDesc = 'Removed All People'

END

ELSE
BEGIN
	PRINT N'Invalid Command'
END

END
RETURN