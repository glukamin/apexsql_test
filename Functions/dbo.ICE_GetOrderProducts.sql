SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_GetOrderProducts] (@Order_ID int)
returns varchar(500)
as
Begin
declare @Result varchar(500)
set @Result = ''
Declare @Product_ID int, @License_Type_ID int, @Maintenance_ID int, @Qty int
DECLARE CurOrderDetails CURSOR FOR SELECT Product_Id, ISNULL(License_Type_ID, 0), ISNULL(Maintenance_ID, 0), Qty FROM ICE_Order_Details where Order_ID=@Order_ID
OPEN CurOrderDetails
FETCH NEXT FROM CurOrderDetails INTO @Product_ID, @License_Type_ID, @Maintenance_ID, @Qty
WHILE @@FETCH_STATUS = 0
BEGIN
	set @Result = @Result + convert(varchar, @Qty)+' '+(Select Product_Name from ICE_Products where Product_ID=@Product_ID)
	if @License_Type_ID > 0
		set @Result = @Result + (Select License_Type from ICE_License_Types where License_Type_ID=@License_Type_ID)
	if @Maintenance_ID > 0
		set @Result = @Result + '+' + (Select Maintenance from ICE_Maintenances where Maintenance_ID=@Maintenance_ID)
	set @Result = @Result + ','
	FETCH NEXT FROM CurOrderDetails INTO @Product_ID, @License_Type_ID, @Maintenance_ID, @Qty
END
CLOSE CurOrderDetails
DEALLOCATE CurOrderDetails

return @Result
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderProducts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderProducts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetOrderProducts]
	TO [davor.dumeljic]
GO
