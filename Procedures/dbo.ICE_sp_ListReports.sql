SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.ICE_sp_ListReports
as
select asprpt_tbl_category.CategoryName, asprpt_tbl_report.ReportID, asprpt_tbl_report.ReportName, asprpt_tbl_proc.Name from asprpt_tbl_report inner join asprpt_tbl_proc on asprpt_tbl_report.ProcID=asprpt_tbl_proc.ProcedureID inner join asprpt_tbl_category on asprpt_tbl_report.reportcategoryid=asprpt_tbl_category.categoryid where asprpt_tbl_category.CategoryID <> 1 order by asprpt_tbl_category.CategoryName, asprpt_tbl_report.ReportName 
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListReports]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListReports]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListReports]
	TO [davor.dumeljic]
GO
