














create procedure [RiskMgmt].[Proc_Update_Risk]

-- Add the parameters for the stored procedure here

	@RiskID int,
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
	@ActionTime datetime2

AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	Declare 
		@LogMessage varchar(1000),
		@PersonID int;

	BEGIN TRY
		SELECT @PersonID = PersonID from RiskMgmt.Person where FullName = @OwnerFullName;

		UPDATE [RiskMgmt].[Risk]
		SET [Title] = @Title,
			[Description] = @Description,
			[Category] = @Category,
			[RiskGroup] = @RiskGroup,
			[Response] = @Response,
			[Type] = @Type,
			[Opportunity_Flag] = @Opportunity_Flag,
			[Owner_PersonID] = @PersonID,
			[Cost_Flag] = @Cost_Flag,
			[Schedule_Flag] = @Schedule_Flag,
			[HSE_Flag] = @HSE_Flag
		WHERE RiskID = @RiskID;

		SELECT @LogMessage = 'Updated Risk ' + LTRIM(STR(@RiskID)) + ' in Risk table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;

		RETURN 0;

	END TRY

	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION; 
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID;
		RETURN 1;
	END CATCH

END