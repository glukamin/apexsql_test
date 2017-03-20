SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_ChangesInOrderTotal]
(
	@DateStart datetime,
	@DateEnd	datetime
)
AS
BEGIN
exec dbo.AUDIT_prc_ReportingStart
exec dbo.AUDIT_prc_ReportingAddFilterValue 'DATABASE', 'apexsql'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'TABLE_NAME', 'ICE_Orders'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'TABLE_OWNER', 'dbo'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'FIELD_NAME', 'Total'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'USER_NAME', 'apexsql'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'ACTION_ID', '1'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'HOST_NAME', 'WIN-B864EJFF4N2'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'APP_NAME', '.Net SqlClient Data Provider'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'APP_NAME', 'Internet Information Services'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'APP_NAME', 'Microsoft SQL Server Management Studio - Query'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'APP_NAME', 'Microsoft SQL Server Management Studio Express - Query'
exec dbo.AUDIT_prc_ReportingAddFilterValue 'APP_NAME', 'Microsoft® Windows® Operating System'
exec [dbo].[AUDIT_prc_StandardReport] @DateStart, @DateEnd, NULL, NULL, NULL, 1200
exec dbo.AUDIT_prc_ReportingEnd
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ChangesInOrderTotal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ChangesInOrderTotal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ChangesInOrderTotal]
	TO [davor.dumeljic]
GO
