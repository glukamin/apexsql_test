SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

Create  Procedure prc_upd_Flag_Customers
as 
Update tiusers Set ProcessFlag=1
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Flag_Customers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Flag_Customers]
	TO [davor.dumeljic]
GO
