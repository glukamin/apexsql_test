SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_GetExtensionProducts](@Order_ID int)
returns varchar(500)
as
Begin
declare @Result varchar(500)set @Result = ''Declare @Product_ID int, @License_Type_ID int, @Maintenance_ID int, @Qty intDECLARE CurExtensionDetails CURSOR FOR SELECT Product_Id, Qty FROM ICE_Extension_Details where Order_ID=@Order_ID
OPEN CurExtensionDetails
FETCH NEXT FROM CurExtensionDetails INTO @Product_ID, @Qty
WHILE @@FETCH_STATUS = 0
BEGIN
	set @Result = @Result + convert(varchar, @Qty)+(Select Product_Name from ICE_Products where Product_ID=@Product_ID)
	set @Result = @Result + 'Maint,'
	FETCH NEXT FROM CurExtensionDetails INTO @Product_ID, @Qty
END
CLOSE CurExtensionDetails
DEALLOCATE CurExtensionDetails
return @ResultEnd
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionProducts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionProducts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionProducts]
	TO [davor.dumeljic]
GO
