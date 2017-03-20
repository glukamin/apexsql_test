SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure dbo.AUDIT_prc_ReportingAddFilterValue
@index nvarchar(100),
@value nvarchar(4000)
as
begin
if not exists (select [value] from ##Filter where [index]=@index and [value] like Replace(@value collate database_default, '[', '[[]'))
	insert into ##Filter([index], [value]) values(@index, @value)
end
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingAddFilterValue]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingAddFilterValue]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[AUDIT_prc_ReportingAddFilterValue]
	TO [davor.dumeljic]
GO
