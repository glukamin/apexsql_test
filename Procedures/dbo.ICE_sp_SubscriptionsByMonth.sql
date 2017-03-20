SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[ICE_sp_SubscriptionsByMonth](@DateBegin datetime, @DateEnd datetime)
as
select dbo.ICE_GetMonthName(Month) as Month, Subscriptions from (
Select Top 100 percent Year(CreatedOn) * 100 + Month(CreatedOn) as [Month], Count(*) as Subscriptions from apexsql.Newsletter where ISNULL(status, 0)=1 And CreatedOn >= @DateBegin And CreatedOn < @DateEnd+1 Group by Year(CreatedOn) * 100 + Month(CreatedOn) order by Year(CreatedOn) * 100 + Month(CreatedOn)
) T



GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SubscriptionsByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SubscriptionsByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SubscriptionsByMonth]
	TO [davor.dumeljic]
GO
