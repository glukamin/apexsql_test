SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [asprpt_prc_UserCount_stats]
/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_stats_UserCount

   DESCRIPTION:  Selects User Count

   ------------------------------------------------------------ */
	AS SELECT COUNT(DISTINCT(UserID)) AS 'User Count'
	FROM [asprpt_tbl_User]
	RETURN @@ERROR



GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_UserCount_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_UserCount_stats]
	TO [davor.dumeljic]
GO
