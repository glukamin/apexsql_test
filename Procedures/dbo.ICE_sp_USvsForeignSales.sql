SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.ICE_sp_USvsForeignSales
(
	@DateBegin datetime,
	@DateEnd	datetime
)
as
begin
	select 'US', SUM(Total) as Revenue
	from ICE_Orders
	where Order_Status_ID in (1,2,4	)
	and Order_Date between @DateBegin and @DateEnd
	and Country_Ship in ('USA', 'USA / United States')
	union
	select 'Non - US', SUM(Total) as Revenue
	from ICE_Orders
	where Order_Status_ID in (1,2,4	)
	and Order_Date between @DateBegin and @DateEnd
	and Country_Ship not in ('USA', 'USA / United States')
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_USvsForeignSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_USvsForeignSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_USvsForeignSales]
	TO [davor.dumeljic]
GO
