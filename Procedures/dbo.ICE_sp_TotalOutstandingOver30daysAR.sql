SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ICE_sp_TotalOutstandingOver30daysAR]
as
declare @T table ( # int, Total float )
insert into @T select count(total) as #, ROUND(sum(total), 2) as total from ice_orders where order_type_id = 0 and order_status_id=1 and order_date+30<=GetDate() 
select * from @T



GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingOver30daysAR]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingOver30daysAR]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalOutstandingOver30daysAR]
	TO [davor.dumeljic]
GO
