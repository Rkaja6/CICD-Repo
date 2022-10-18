







create procedure [RiskMgmt].[Proc_Insert_Tag_Additional_People]

-- Add the parameters for the stored procedure here

	@RiskID int,
	@FullName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	Declare @LogMessage varchar(1000);
	Declare @PersonID int;

	IF EXISTS 
		(
		-- Check if new person is already in Additional People table
		SELECT 1 
		FROM [RiskMgmt].[Tag_Additional_People] T
		INNER JOIN RiskMgmt.Person  P
			ON T.PersonID = P.PersonID
		WHERE P.FullName = @FullName
		AND T.RiskID = @RiskID
		UNION ALL
		-- Check if new person is already the owner
		SELECT 1
		FROM RiskMgmt.Risk R
		INNER JOIN RiskMgmt.Person P
			ON R.Owner_PersonID = P.PersonID
		WHERE P.FullName = @FullName
		AND R.RiskID = @RiskID
		) 
	BEGIN
		SET @LogMessage = 'RiskID ' + ltrim(str(@RiskID)) + ' and ' + @FullName + ' already exists in the Tag_Additional_People table.';
		EXEC [RiskMgmt].[Proc_Logging] @ObjectId = @@PROCID, @AdditionalInfo = @LogMessage;
		RAISERROR(@LogMessage, 16, 1) ;
		RETURN 1;
	END
	
	ELSE

	BEGIN
		BEGIN TRY
			SELECT @PersonID = PersonID from RiskMgmt.Person where FullName = @FullName;

			INSERT INTO [RiskMgmt].[Tag_Additional_People]
				(RiskID,
				PersonID)
			SELECT 
				@RiskID,
				@PersonID;
		
			SET @LogMessage = 'Added ' + @FullName + ' to RiskID ' + ltrim(str(@RiskID)) + '.';
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