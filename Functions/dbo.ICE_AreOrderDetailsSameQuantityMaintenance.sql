SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create function dbo.ICE_AreOrderDetailsSameQuantityMaintenance (@Order_ID int)
returns tinyint
as
Begin
if (
select Count(*) from ICE_Order_Details where Order_ID=@Order_ID and ISNULL(Qty, 0)=ISNULL((select Top 1 Qty from ICE_Order_Details where Order_ID=@Order_ID), 0) and ISNULL(Maintenance_ID, 0)=ISNULL((select Top 1 Maintenance_ID from ICE_Order_Details where Order_ID=@Order_ID), 0)) = (select Count(*) from ICE_Order_Details where Order_ID=@Order_ID)
	return 1
return 0
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_AreOrderDetailsSameQuantityMaintenance]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_AreOrderDetailsSameQuantityMaintenance]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_AreOrderDetailsSameQuantityMaintenance]
	TO [davor.dumeljic]
GO
