SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[ICE_sp_TotalOutstandingAR]
as
declare @T table ( # int, Total float )
insert into @T select count(total) as #, ROUND(sum(total), 2) as total from ice_orders where order_type_id = 0 and order_status_id=1 

select * from @T




GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingAR]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingAR]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingAR]
	TO [davor.dumeljic]
GO
