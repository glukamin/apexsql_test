SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.ICE_sp_AccountTurnOverRatio(@DateBegin datetime, @DateEnd datetime)
as
declare @T table ( Average float )
insert into @T select AVG(DateDiff(d, Order_Date, Paid_Date)) from ICE_Orders where Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Type_ID=0 and Order_Status_ID=2 and not Paid_Date is null and Paid_Date>=Order_Date
select * from @T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatio]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatio]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatio]
	TO [davor.dumeljic]
GO
