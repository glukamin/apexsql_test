SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [asprpt_prc_Reports_popularity_stats]

/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_Reports_popularity_stats

   DESCRIPTION:  

   ------------------------------------------------------------ */

	AS
	SELECT ReportName AS 'Report Name', Count(StatsReportID) AS 'Report Count'
	FROM [asprpt_tbl_Report] INNER JOIN [asprpt_tbl_Stats] AS b ON ReportID = b.StatsReportID
	GROUP BY ReportName
	ORDER BY Count(StatsReportID) DESC
	RETURN @@ERROR

GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Reports_popularity_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Reports_popularity_stats]
	TO [davor.dumeljic]
GO
