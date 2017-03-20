SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [asprpt_prc_Activity_over_time_stats]

/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_Activity_over_time_stats

   DESCRIPTION:  

   ------------------------------------------------------------ */
	AS 
	SELECT DISTINCT(ReportName), 
		DATEPART(hh,StatsDateNow) AS 'Hour', 
		Day(StatsDateNow) AS 'Day', 
		Month(StatsDateNow) AS 'Month', 
		Year(StatsDateNow) AS 'Year' 
	FROM [asprpt_tbl_Report] INNER JOIN [asprpt_tbl_Stats] ON StatsReportID = ReportID
	ORDER BY ReportName ASC
	RETURN @@ERROR



GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Activity_over_time_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Activity_over_time_stats]
	TO [davor.dumeljic]
GO
