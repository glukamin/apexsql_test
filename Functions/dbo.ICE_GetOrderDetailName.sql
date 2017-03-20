SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ICE_GetOrderDetailName](@Order_Detail_ID int)
returns varchar(200)
as
Begin
declare @Result varchar(200), @Order_ID int, @Order_Date datetime, @Product_ID int, @License_Type_ID int, @Maintenance_ID int, @Qty int
select @Order_ID=ICE_Orders.Order_ID, @Order_Date=Order_Date, @Product_ID=Product_ID, @License_Type_ID=License_Type_ID, @Maintenance_ID=Maintenance_ID, @Qty=ICE_Order_Details.Qty from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where Order_Detail_ID=ISNULL(@Order_Detail_ID, 0)
set @Result = 'ID: ' + convert(varchar, @Order_ID) + ' Date: ' + convert(varchar, @Order_Date, 101)+' '+dbo.ICE_GetProductAbvName(@Product_ID)
set @Result = @Result + ' : ' + Convert(varchar, @Qty) + ' ' + (Select Replace(License_Type, ' License', '') from ICE_License_Types where License_Type_ID=ISNULL(@License_Type_ID, 0))
If ISNULL(@Maintenance_ID, 0) > 0
set @Result = @Result + ' + ' + (Select Replace(Maintenance, ' Software Assurance', '') from ICE_Maintenances where Maintenance_ID=ISNULL(@Maintenance_ID, 0))
return @Result
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailName]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailName]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderDetailName]
	TO [davor.dumeljic]
GO
