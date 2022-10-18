-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION ETL.[fn_SplitString]
(
	-- Add the parameters for the function here
@List nvarchar(2000),
@SplitOn nvarchar(5)
)
RETURNS 
@RtnValue TABLE 
(
Id int identity(1,1),
Value nvarchar(100)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	While (Charindex( @SplitOn, @List)>0)
	Begin 
		Insert Into @RtnValue (value)
		Select Value = ltrim( rtrim( Substring( @List, 1, Charindex( @SplitOn, @List) -1))) 
		Set @List = Substring( @List, Charindex( @SplitOn, @List) + len( @SplitOn) , len( @List))
	End 

	Insert Into @RtnValue (Value)
	Select Value = ltrim(rtrim(@List))

	RETURN 
END