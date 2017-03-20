SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
create procedure dbo.AUDIT_prc_ReportingStart
as
begin
create table ##Filter([index] nvarchar(20), [value] nvarchar(4000))
end
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingStart]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingStart]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingStart]
	TO [davor.dumeljic]
GO
