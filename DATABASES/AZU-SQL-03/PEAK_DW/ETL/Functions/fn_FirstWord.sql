




Create Function [ETL].[fn_FirstWord]
	(
	@String VarChar(1000)
	)
Returns VarChar(1000)

AS

Begin
	
    Set @String = RTRIM(LTRIM(@String))

    Return CASE CHARINDEX(' ', @String, 1)
		WHEN 0 THEN @String
		ELSE SUBSTRING(@String, 1, CHARINDEX(' ', @String, 1) - 1)
		END 

End