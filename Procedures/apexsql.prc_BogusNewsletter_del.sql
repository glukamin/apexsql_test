SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE prc_BogusNewsletter_del
As
	DELETE
	FROM [Newsletter]
	WHERE DATEDIFF(day, Createdon , CURRENT_TIMESTAMP) > 7  
	And Status =0
GO
GRANT EXECUTE
	ON [apexsql].[prc_BogusNewsletter_del]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_BogusNewsletter_del]
	TO [davor.dumeljic]
GO
