SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2] 
(
	@DateBegin datetime	
)
AS
BEGIN
	DECLARE @DateEnd datetime	
	SET @DateEnd = GetDATE()
	EXEC VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees @DateBegin = @DateBegin, @DateEnd = @DateEnd
	--SELECT dbo.ICE_GetMonthName(WA.Month) as [Date], ROUND(CONVERT(real, WA.Count)/CONVERT(real, WOA.Count), 2) as Ratio
	--FROM [dbo].[VIP_Posts_Without_Apex](@DateBegin, @DateEnd) WOA
	--JOIN [dbo].[VIP_Posts_With_Apex](@DateBegin, @DateEnd) WA ON WOA.Month = WA.Month
	--ORDER BY WOA.Month
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2]
	TO [davor.dumeljic]
GO
