

create procedure [RiskMgmt].[Proc_Logging]

-- Add the parameters for the stored procedure here
	@ObjectID INT,
	@DatabaseID INT = NULL,
	@AdditionalInfo varchar(max) =  NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ProcedureName nvarchar(100);

	SELECT
		@DatabaseID = COALESCE(@DatabaseID, DB_ID()),
		@ProcedureName = COALESCE(QUOTENAME(OBJECT_SCHEMA_NAME(@ObjectID, @DatabaseID)) + '.' + QUOTENAME(OBJECT_NAME(@ObjectID, @DatabaseID)), ERROR_PROCEDURE());

	INSERT RiskMgmt.System_Proc_Log
	(
	ProcedureName,
	ErrorLine,
	ErrorMessage,
	AdditionalInfo
	)
	SELECT
		@ProcedureName,
		ERROR_LINE(),
		ERROR_MESSAGE(),
		@AdditionalInfo;

END