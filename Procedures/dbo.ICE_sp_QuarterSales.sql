SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  dbo.ICE_sp_QuarterSales
(
	@Today	datetime
)
as
BEGIN
DECLARE @BeginDate datetime
DECLARE @EndDate datetime
DECLARE @Month int
DECLARE @ThisQuarterToDate money
DECLARE @ThisQuarterExtrapolate money
DECLARE @PrevQuarterToDate money
DECLARE @PrevQuarterExtrapolate money
DECLARE @DaysInThisQuarter int
DECLARE @IncreasePercent real

SET @DaysInThisQuarter = dbo.ICE_GetQuarterDays(dbo.ICE_Quarter(@Today))

-----------------------------------------------------------------------------------------------------
-- Get data for this quarter
-----------------------------------------------------------------------------------------------------
SET @Month = MONTH(dbo.ICE_GetFirstDayOfQuarter(@Today))
SET @EndDate = @Today
SET @EndDate = @EndDate + ' 23:59:59'
SET @BeginDate = dbo.ICE_GetFirstDayOfQuarter(@Today) 

PRINT @BeginDate
PRINT @EndDate
PRINT dbo.ICE_GetLastDayOfQuarter(@Today)

SET @ThisQuarterToDate = dbo.ICE_GetTotalSales(@BeginDate,@EndDate)
--SET @ThisQuarterExtrapolate = @ThisQuarterToDate * @DaysInThisQuarter / DateDiff(d, dbo.ICE_GetFirstDayOfQuarter(@Today), @Today)
IF MONTH(@BeginDate) = MONTH(@EndDate)
	SET @ThisQuarterExtrapolate = @ThisQuarterToDate * 3
IF MONTH(@BeginDate) + 1 = MONTH(@EndDate)
	SET @ThisQuarterExtrapolate = @ThisQuarterToDate * 3 / 2
IF MONTH(@BeginDate) + 2 = MONTH(@EndDate)
	SET @ThisQuarterExtrapolate = @ThisQuarterToDate

-----------------------------------------------------------------------------------------------------
-- Get data for previous quarter
-----------------------------------------------------------------------------------------------------
SET @EndDate = DATEADD(yy, -1, @EndDate) 
SET @Month = MONTH(dbo.ICE_GetFirstDayOfQuarter(@EndDate))
SET @BeginDate = DATEADD(yy, -1, @BeginDate) 

PRINT @BeginDate
PRINT @EndDate
PRINT dbo.ICE_GetLastDayOfQuarter(@EndDate)

SET @PrevQuarterToDate = dbo.ICE_GetTotalSales(@BeginDate, @EndDate)
--SET @PrevQuarterExtrapolate = @PrevQuarterToDate * @DaysInThisQuarter / DateDiff(d, dbo.ICE_GetFirstDayOfQuarter(@Today), @Today)
IF MONTH(@BeginDate) = MONTH(@EndDate)
	SET @PrevQuarterExtrapolate = @PrevQuarterToDate * 3
IF MONTH(@BeginDate) + 1 = MONTH(@EndDate)
	SET @PrevQuarterExtrapolate = @PrevQuarterToDate * 3 / 2
IF MONTH(@BeginDate) + 2 = MONTH(@EndDate)
	SET @PrevQuarterExtrapolate = @PrevQuarterToDate
-----------------------------------------------------------------------------------------------------
-- Display results
-----------------------------------------------------------------------------------------------------

SET @IncreasePercent = (@ThisQuarterExtrapolate - @PrevQuarterExtrapolate)/@PrevQuarterExtrapolate * 100

SELECT CONVERT(varchar, YEAR(@Today)) + ' - Q' + CONVERT(varchar, dbo.ICE_Quarter(@Today)) AS Year, CONVERT(varchar, @ThisQuarterToDate,1) as Total, CONVERT(varchar, @ThisQuarterExtrapolate, 1) AS Extrapolate, CONVERT(varchar, ROUND(@IncreasePercent, 2)) AS [% Increase]
union all
SELECT CONVERT(varchar, YEAR(@EndDate)) + ' - Q' + CONVERT(varchar, dbo.ICE_Quarter(@EndDate)) AS Year, CONVERT(varchar, @PrevQuarterToDate,1) as Total, CONVERT(varchar, @PrevQuarterExtrapolate, 1) as Extrapolate, '-' AS [% Increase]
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterSales]
	TO [davor.dumeljic]
GO
