SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [asprpt_prc_ReportCount_stats]
/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_stats_ReportCount

   DESCRIPTION:  Selects Report Count

   ------------------------------------------------------------ */
	AS SELECT COUNT(DISTINCT(ReportID)) AS 'Report Count'
	FROM [asprpt_tbl_Report]
	RETURN @@ERROR

GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_ReportCount_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_ReportCount_stats]
	TO [davor.dumeljic]
GO
