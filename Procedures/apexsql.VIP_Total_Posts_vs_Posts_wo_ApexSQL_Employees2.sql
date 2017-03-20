SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2
(
	@DateBegin datetime
)
AS 
BEGIN
	DECLARE @DateEnd datetime
	SET @DateEnd = getdate()	
	EXEC dbo.VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees @DateBegin=@DateBegin, @DateEnd = @DateEnd	
END
GO
GRANT EXECUTE
	ON [apexsql].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[VIP_Total_Posts_vs_Posts_wo_ApexSQL_Employees2]
	TO [davor.dumeljic]
GO
