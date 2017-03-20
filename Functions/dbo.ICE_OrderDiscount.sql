SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[ICE_OrderDiscount](@Order_ID int)
returns money
as
begin
return dbo.ICE_IsZero(ROUND((Select (ISNULL((select Sum(qty * (Price - ISNULL(Discount, 0))) from ICE_Order_Details where Order_ID=@Order_ID ), 0)+ISNULL((select Sum(qty * (Price - ISNULL(Discount, 0))) from ICE_Extension_Details where Order_ID=@Order_ID ), 0)) * ISNULL(Discount, 0) / 100 from ICE_Orders where Order_ID=@Order_ID), 0))
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderDiscount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderDiscount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_OrderDiscount]
	TO [davor.dumeljic]
GO
