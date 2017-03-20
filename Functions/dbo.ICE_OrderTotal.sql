SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE Function [dbo].[ICE_OrderTotal](@Order_ID int)
returns money
as
begin
return dbo.ICE_IsZero((Select Amount + ISNULL(Wire_Transfer_Amount, 0) - ISNULL(dbo.ICE_OrderDiscount(@Order_ID), 0) from ICE_Orders where Order_ID=@Order_ID))
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderTotal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderTotal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderTotal]
	TO [davor.dumeljic]
GO
