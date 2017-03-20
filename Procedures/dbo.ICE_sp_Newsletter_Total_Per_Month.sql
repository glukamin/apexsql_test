SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_Newsletter_Total_Per_Month
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
      SELECT
          dbo.ICE_GetMonthName(Year(CreatedOn) * 100 + MONTH(CreatedOn)) AS [Month] ,
          count(*) AS Total
      FROM
          apexsql.Newsletter
      WHERE
          apexsql.Newsletter.Status = 1 AND apexsql.Newsletter.CreatedOn BETWEEN @DateStart AND @DateEnd
      GROUP BY
          Year(CreatedOn) * 100 + MONTH(CreatedOn)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total_Per_Month]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total_Per_Month]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total_Per_Month]
	TO [davor.dumeljic]
GO
