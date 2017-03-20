SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

Create Procedure prc_upd_Flag_Emails
as 
Update Newsletter Set ProcessFlag=1
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Flag_Emails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Flag_Emails]
	TO [davor.dumeljic]
GO
