SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
create procedure dbo.AUDIT_prc_ReportingEnd
as
begin
drop table ##Filter
end
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingEnd]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingEnd]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingEnd]
	TO [davor.dumeljic]
GO
