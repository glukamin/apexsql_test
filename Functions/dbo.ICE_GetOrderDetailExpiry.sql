SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function dbo.ICE_GetOrderDetailExpiry (@Order_Detail_ID int)
returns datetime
as
Begin
declare @Free_Upgrades tinyint, @Expiry datetime
Select @Free_Upgrades = ICE_Orders.Free_Upgrades from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where ICE_Order_Details.Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)
if ISNULL(@Free_Upgrades, 0)=1
	Set @Expiry = convert(datetime, '12/31/9999 11:59 PM')
else
Begin
	Select @Expiry = Max(Extension_Expiry) from ICE_Extension_Details where Extension_Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)
	If @Expiry is Null
		Select @Expiry = DateAdd(Year, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where ICE_Order_Details.Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)
End
return @Expiry
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailExpiry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailExpiry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailExpiry]
	TO [davor.dumeljic]
GO
