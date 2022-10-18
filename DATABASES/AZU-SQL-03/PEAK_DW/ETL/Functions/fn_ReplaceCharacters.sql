



Create Function [ETL].[fn_ReplaceCharacters]
	(
	@String VarChar(1000),
	@MatchExpression VARCHAR(255),
	@ReplacementString varchar(255)
	)
Returns VarChar(1000)

AS

/*** HOW TO USE FUNCTION:

Alphabetic only:
SELECT dbo.fn_StripCharacters('a1!s2@d3#f4$', '^a-z', '')

Numeric only:
SELECT dbo.fn_StripCharacters('a1!s2@d3#f4$', '^0-9', '')

Alphanumeric & space only:
SELECT dbo.fn_StripCharacters('a1!s2@d3#f4$', '^a-z0-9 ', '')

Non-alphanumeric:
SELECT dbo.fn_StripCharacters('a1!s2@d3#f4$', 'a-z0-9', '')

***/

Begin
	
    Set @MatchExpression = '%['+ @MatchExpression +']%'

    While PatIndex(@MatchExpression, @String) > 0
        Set @String = Stuff(@String, PatIndex(@MatchExpression, @String), 1, @ReplacementString)

    Return @String
End