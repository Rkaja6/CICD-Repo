CREATE PROCEDURE [RPT].[Proc_Populate_Dates_Tbl]
	@Start_Date DATE,
	@End_Date DATE
AS
BEGIN
	SET NOCOUNT ON;

IF @Start_Date IS NULL OR @End_Date IS NULL
BEGIN
	SELECT 'Start and end dates MUST be provided in order for this stored procedure to work.';
	RETURN;
END
 
	IF @Start_Date > @End_Date
	BEGIN
		SELECT 'Start date must be less than or equal to the end date.';
		RETURN;
	END

 
DELETE FROM RPT.Dates
WHERE RPT.Dates.Calendar_Date BETWEEN @Start_Date AND @End_Date;

DECLARE @Date_Counter DATE = @Start_Date;
DECLARE @Calendar_Date_String VARCHAR(10);
DECLARE @Calendar_Month TINYINT;
DECLARE @Calendar_Day TINYINT;
DECLARE @Calendar_Year SMALLINT;
DECLARE @Calendar_Quarter TINYINT;
DECLARE @Day_Name VARCHAR(9);
DECLARE @Day_of_Week TINYINT;
DECLARE @Day_of_Week_in_Month TINYINT;
DECLARE @Day_of_Week_in_Year TINYINT;
DECLARE @Day_of_Week_in_Quarter TINYINT;
DECLARE @Day_of_Quarter TINYINT;
DECLARE @Day_of_Year SMALLINT;
DECLARE @Week_of_Month TINYINT;
DECLARE @Week_of_Quarter TINYINT;
DECLARE @Week_of_Year TINYINT;
DECLARE @Month_Name VARCHAR(9);
DECLARE @First_Date_of_Week DATE;
DECLARE @Last_Date_of_Week DATE;
DECLARE @First_Date_of_Month DATE;
DECLARE @Last_Date_of_Month DATE;
DECLARE @First_Date_of_Quarter DATE;
DECLARE @Last_Date_of_Quarter DATE;
DECLARE @First_Date_of_Year DATE;
DECLARE @Last_Date_of_Year DATE;
DECLARE @Is_Holiday BIT;
DECLARE @Is_Holiday_Season BIT;
DECLARE @Holiday_Name VARCHAR(50);
DECLARE @Holiday_Season_Name VARCHAR(50);
DECLARE @Is_Weekday BIT;
DECLARE @Is_Business_Day BIT;
DECLARE @Is_Leap_Year BIT;
DECLARE @Days_in_Month TINYINT;

WHILE @Date_Counter <= @End_Date

	BEGIN
 
	SELECT @Calendar_Month = DATEPART(MONTH, @Date_Counter);
	SELECT @Calendar_Day = DATEPART(DAY, @Date_Counter);
	SELECT @Calendar_Year = DATEPART(YEAR, @Date_Counter);
	SELECT @Calendar_Quarter = DATEPART(QUARTER, @Date_Counter);
	SELECT @Day_of_Week = DATEPART(WEEKDAY, @Date_Counter);
	SELECT @Day_of_Year = DATEPART(DAYOFYEAR, @Date_Counter);
	SELECT @Week_of_Year = DATEPART(WEEK, @Date_Counter);

	SELECT @Calendar_Date_String = CAST(@Calendar_Month AS VARCHAR(10)) + '/' + CAST(@Calendar_Day 
	AS VARCHAR(10)) + '/' + CAST(@Calendar_Year AS VARCHAR(10));

	SELECT @Is_Holiday = CASE
					WHEN EXISTS 
					(
					SELECT 1
					FROM RPT.TELL_Holidays
					WHERE Calendar_Date = @Date_Counter
					)
						THEN 1
					ELSE 0
				END;

	SELECT @Holiday_Name = Holiday_Name
	FROM RPT.TELL_Holidays
	WHERE Calendar_Date = @Date_Counter;

	SELECT @Is_Weekday = CASE
					WHEN @Day_of_Week IN (1, 7)
						THEN 0
					ELSE 1
				END;
	SELECT @Is_Business_Day =	@Is_Weekday;
 
	SELECT @Day_Name = CASE @Day_of_Week
						WHEN 1 THEN 'Sunday'
						WHEN 2 THEN 'Monday'
						WHEN 3 THEN 'Tuesday'
						WHEN 4 THEN 'Wednesday'
						WHEN 5 THEN 'Thursday'
						WHEN 6 THEN 'Friday'
						WHEN 7 THEN 'Saturday'
					END;
 
	SELECT @Month_Name = CASE @Calendar_Month
						WHEN 1 THEN 'January'
						WHEN 2 THEN 'February'
						WHEN 3 THEN 'March'
						WHEN 4 THEN 'April'
						WHEN 5 THEN 'May'
						WHEN 6 THEN 'June'
						WHEN 7 THEN 'July'
						WHEN 8 THEN 'August'
						WHEN 9 THEN 'September'
						WHEN 10 THEN 'October'
						WHEN 11 THEN 'November'
						WHEN 12 THEN 'December'
					END;
 
	SELECT @Day_of_Quarter = DATEDIFF(DAY, DATEADD(QUARTER, DATEDIFF(QUARTER, 0 , @Date_Counter), 0), @Date_Counter) + 1;
	SELECT @Day_of_Year = DATEPART(DAYOFYEAR, @Date_Counter);
	SELECT @Week_of_Month = DATEDIFF(WEEK, DATEADD(WEEK, DATEDIFF(WEEK, 0, DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date_Counter), 0)), 0), @Date_Counter ) + 1;
	SELECT @Week_of_Quarter = DATEDIFF(DAY, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, @Date_Counter), 0), @Date_Counter)/7 + 1;

	SELECT @First_Date_of_Week = DATEADD(DAY, -1 * @Day_of_Week + 1, @Date_Counter);
	SELECT @Last_Date_of_Week = DATEADD(DAY, 1 * (7 - @Day_of_Week), @Date_Counter);
	SELECT @First_Date_of_Month = DATEADD(DAY, -1 * DATEPART(DAY, @Date_Counter) + 1, @Date_Counter);
	SELECT @Last_Date_of_Month = EOMONTH(@Date_Counter);
	SELECT @First_Date_of_Quarter = DATEADD(QUARTER, DATEDIFF(QUARTER, 0, @Date_Counter), 0);
	SELECT @Last_Date_of_Quarter = DATEADD (DAY, -1, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, @Date_Counter) + 1, 0));
	SELECT @First_Date_of_Year = DATEADD(YEAR, DATEDIFF(YEAR, 0, @Date_Counter), 0);
	SELECT @Last_Date_of_Year = DATEADD(DAY, -1, DATEADD(YEAR, DATEDIFF(YEAR, 0, @Date_Counter) + 1, 0));

	SELECT @Day_of_Week_in_Month = (@Calendar_Day + 6) / 7;
	SELECT @Day_of_Week_in_Year = (@Day_of_Year + 6) / 7;
	SELECT @Day_of_Week_in_Quarter = (@Day_of_Quarter + 6) / 7;
 
	SELECT @Is_Leap_Year = CASE
						WHEN @Calendar_Year % 4 <> 0 THEN 0
						WHEN @Calendar_Year % 100 <> 0 THEN 1
						WHEN @Calendar_Year % 400 <> 0 THEN 0
						ELSE 1
					END;
 
	SELECT @Days_in_Month = CASE
						WHEN @Calendar_Month IN (4, 6, 9, 11) THEN 30				
											WHEN @Calendar_Month IN (1, 3, 5, 7, 8, 10, 12) THEN 31
						WHEN @Calendar_Month = 2 AND @Is_Leap_Year = 1 THEN 29
						ELSE 28
					END;

	INSERT INTO RPT.Dates
		(Calendar_Date, Calendar_Date_String, Calendar_Month, Calendar_Day, Calendar_Year, 
	Calendar_Quarter, Day_Name, Day_of_Week, Day_of_Week_in_Month, Day_of_Week_in_Year, 
	Day_of_Week_in_Quarter, Day_of_Quarter, Day_of_Year, Week_of_Month, Week_of_Quarter, Week_of_Year, 
	Month_Name, First_Date_of_Week, Last_Date_of_Week, First_Date_of_Month, Last_Date_of_Month, 
	First_Date_of_Quarter, Last_Date_of_Quarter, First_Date_of_Year, Last_Date_of_Year, Is_Holiday, 
	Is_Holiday_Season, Holiday_Name, Holiday_Season_Name, Is_Weekday, Is_Business_Day, 
	Previous_Business_Day, Next_Business_Day, Is_Leap_Year, Days_in_Month)
		SELECT
			@Date_Counter AS Calendar_Date,
			@Calendar_Date_String AS Calendar_Date_String,
			@Calendar_Month AS Calendar_Month,
			@Calendar_Day AS Calendar_Day,
			@Calendar_Year AS Calendar_Year,
			@Calendar_Quarter AS Calendar_Quarter,
			@Day_Name AS Day_Name,
			@Day_of_Week AS Day_of_Week,
			@Day_of_Week_in_Month AS Day_of_Week_in_Month,
			@Day_of_Week_in_Year AS Day_of_Week_in_Year,
			@Day_of_Week_in_Quarter AS Day_of_Week_in_Quarter,
			@Day_of_Quarter AS Day_of_Quarter,
			@Day_of_Year AS Day_of_Year,
			@Week_of_Month AS Week_of_Month,
			@Week_of_Quarter AS Week_of_Quarter,
			@Week_of_Year AS Week_of_Year,
			@Month_Name AS Month_Name,
			@First_Date_of_Week AS First_Date_of_Week,
			@Last_Date_of_Week AS Last_Date_of_Week,
			@First_Date_of_Month AS First_Date_of_Month,
			@Last_Date_of_Month AS Last_Date_of_Month,
			@First_Date_of_Quarter AS First_Date_of_Quarter,
			@Last_Date_of_Quarter AS Last_Date_of_Quarter,
			@First_Date_of_Year AS First_Date_of_Year,
			@Last_Date_of_Year AS Last_Date_of_Year,
			@Is_Holiday AS Is_Holiday,
			0 AS Is_Holiday_Season,
			@Holiday_Name AS Holiday_Name,
			NULL AS Holiday_Season_Name,
			@Is_Weekday AS Is_Weekday,
			@Is_Business_Day AS Is_Business_Day, -- Will be populated with weekends to start.
			NULL AS Previous_Business_Day,
			NULL AS Next_Business_Day,
			@Is_Leap_Year AS Is_Leap_Year,
			@Days_in_Month AS Days_in_Month;

	WITH CTE_Business_Days AS (
		SELECT
			Business_Days.Calendar_Date
		FROM RPT.Dates Business_Days
		WHERE Business_Days.Is_Business_Day = 1
		AND Business_Days.Is_Holiday = 0
	)
	UPDATE Date_Current
		SET Previous_Business_Day = CTE_Business_Days.Calendar_Date
	FROM RPT.Dates Date_Current
	INNER JOIN CTE_Business_Days
	ON CTE_Business_Days.Calendar_Date = (SELECT MAX(Previous_Business_Day.Calendar_Date) FROM CTE_Business_Days Previous_Business_Day
										  WHERE Previous_Business_Day.Calendar_Date < Date_Current.Calendar_Date)
	WHERE Date_Current.Calendar_Date BETWEEN @Start_Date AND @End_Date;

	WITH CTE_Business_Days AS (
		SELECT
			Business_Days.Calendar_Date
		FROM RPT.Dates Business_Days
		WHERE Business_Days.Is_Business_Day = 1
		AND Business_Days.Is_Holiday = 0
	)
	UPDATE Date_Current
		SET Next_Business_Day = CTE_Business_Days.Calendar_Date
	FROM RPT.Dates Date_Current
	INNER JOIN CTE_Business_Days
	ON CTE_Business_Days.Calendar_Date = (SELECT MIN(Next_Business_Day.Calendar_Date) FROM CTE_Business_Days Next_Business_Day
										  WHERE Next_Business_Day.Calendar_Date > Date_Current.Calendar_Date)
	WHERE Date_Current.Calendar_Date BETWEEN @Start_Date AND @End_Date;

	SELECT @Date_Counter = DATEADD(DAY, 1, @Date_Counter);

	END
END