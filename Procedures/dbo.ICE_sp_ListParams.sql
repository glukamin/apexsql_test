SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_ListParams](@reportid int)
as
select paramname, datatype from asprpt_tbl_reportparams where paramreportid=@reportid
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListParams]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListParams]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ListParams]
	TO [davor.dumeljic]
GO
