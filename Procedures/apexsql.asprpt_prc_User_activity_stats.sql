SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [asprpt_prc_User_activity_stats]

/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_User_activity _stats

   DESCRIPTION:  

   ------------------------------------------------------------ */

	AS
	SELECT UserName AS 'User Name', Count(StatsReportID) AS 'Report Count'
	FROM [asprpt_tbl_User] INNER JOIN [asprpt_tbl_Stats] AS b ON UserID = b.StatsUserID
	GROUP BY UserName
	ORDER BY UserName ASC
	RETURN @@ERROR

GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_User_activity_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_User_activity_stats]
	TO [davor.dumeljic]
GO
