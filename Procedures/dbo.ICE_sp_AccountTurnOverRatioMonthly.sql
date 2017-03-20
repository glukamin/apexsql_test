SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ICE_sp_AccountTurnOverRatioMonthly](@DateBegin datetime, @DateEnd datetime)
as
select dbo.ICE_GetMonthName(T.Month) as Month, T.AR from
(select top 100 percent Year(Order_Date) * 100 + Month(Order_Date) as Month, AVG(DateDiff(d, Order_Date, Paid_Date)) as AR from ICE_Orders where Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Type_ID=0 And Order_Status_ID=2 and not Paid_Date is null and Paid_Date>=Order_Date Group by Year(Order_Date) * 100 + Month(Order_Date) order by Year(Order_Date) * 100 + Month(Order_Date)
) T


GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatioMonthly]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatioMonthly]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AccountTurnOverRatioMonthly]
	TO [davor.dumeljic]
GO
