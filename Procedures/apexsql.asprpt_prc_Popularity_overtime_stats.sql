SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [asprpt_prc_Popularity_overtime_stats]
/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_Popularity_overtime_stats

   DESCRIPTION:


   ------------------------------------------------------------ */
	AS 
	SELECT a.ReportName, Sum(StatsReportID) AS 'Report View'
	FROM [asprpt_tbl_Report] AS a INNER JOIN [asprpt_tbl_Stats] ON StatsReportID = ReportID
	GROUP BY a.ReportName
	ORDER BY a.ReportName DESC
	RETURN @@ERROR


GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Popularity_overtime_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Popularity_overtime_stats]
	TO [davor.dumeljic]
GO
