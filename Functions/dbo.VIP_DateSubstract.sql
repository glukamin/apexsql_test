SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[VIP_DateSubstract]
(
	@InitialDate datetime,
	@Year int,
	@Month int,
	@Day int
)
RETURNS datetime
AS
BEGIN
	DECLARE @Result datetime
	
	IF @Year is null
		SET @Year = 0
	IF @Month is null
		SET @Month = 0
	IF @Day is null 
		SET	@Day = 0
		
	SET @Result = (SELECT DATEADD(yy, -@Year, @InitialDate))
	SET @Result = (SELECT DATEADD(mm, -@Month, @Result))
	SET @Result = (SELECT DATEADD(dd, -@Day, @Result))
	--Remove hours
	SET @Result = (SELECT DATEADD(hh, -DATEPART(hh, @Result), @Result))
	--Remove minutes
	SET @Result = (SELECT DATEADD(mi, -DATEPART(mi, @Result), @Result))
	--Remove seconds
	SET @Result = (SELECT DATEADD(ss, -DATEPART(ss, @Result), @Result))
	RETURN @Result

	-- Declare the return variable here
	--DECLARE @ResultYear int
	--DECLARE @ResultMonth int
	--DECLARE @ResultDay int
	--DECLARE @Result datetime
	--SET @ResultYear = DATEPART(year, @InitialDate)
	--SET @ResultMonth = DATEPART(month, @InitialDate)
	--SET @ResultDay = DATEPART(day, @InitialDate)
	
	--IF @Month < 0
	--	SET @Month = 0
	--IF @Day < 0
	--	SET @Day = 0
	--IF @Year < 0
	--	SET @Year = 0		
	
	--IF @Year is not null
	--	SET @ResultYear = @ResultYear - @Year
		
	--IF @Month is not null 
	--BEGIN
	--	IF @Month > @ResultMonth 
	--	BEGIN 
	--		SET @ResultYear = @ResultYear - 1
	--		SET @ResultMonth = 12 - @Month + @ResultMonth
	--	END
	--	ELSE
	--		SET @ResultMonth = @ResultMonth - @Month
	--		IF @ResultMonth = 0
	--		BEGIN
	--			SET @ResultMonth = 12
	--			SET @ResultYear = @ResultYear - 1
	--		END	
	--END
	--IF @Day is not null
	--BEGIN
	--	IF @Day >= @ResultDay
	--	BEGIN 
	--		IF @ResultMonth = 1
	--		BEGIN 
	--			SET @ResultMonth = 12
	--			SET @ResultYear = @ResultYear - 1
	--		END
	--		ELSE
	--		BEGIN
	--			SET @ResultMonth = @ResultMonth - 1
	--			SET @ResultDay = dbo.VIP_GetNumOfDaysInMonth(@ResultMonth) - @Day + @ResultDay
	--		END
	--	END
	--	ELSE
	--		SET @ResultDay = @ResultDay - @Day 
	--END
	
	--RETURN CONVERT(DATETIME, CONVERT(varchar,@ResultYear) + '-' + CONVERT(varchar,@ResultMonth) + '-' + CONVERT(varchar,@ResultDay))
	
END





GO
GRANT EXECUTE
	ON [dbo].[VIP_DateSubstract]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_DateSubstract]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_DateSubstract]
	TO [davor.dumeljic]
GO
