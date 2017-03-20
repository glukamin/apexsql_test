SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ICE_GetQuoteDetailProduct](@Quote_Detail_ID int)
returns varchar(200)
as
Begin
declare @Result varchar(200), @Product_ID int, @License_Type_ID int, @Maintenance_ID int, @Shareit_ID int
select @Product_ID=Product_ID, @License_Type_ID=License_Type_ID, @Maintenance_ID=Maintenance_ID from ICE_Quote_Details where Quote_Detail_ID=ISNULL(@Quote_Detail_ID, 0)
set @Shareit_ID = (SELECT Shareit_ID FROM ICE_Shareit_IDs IDs WHERE IDs.Product_ID = @Product_ID AND IDs.License_Type_ID = @License_Type_ID AND IDs.Maintenance_ID = @Maintenance_ID)
set @Result = (Select Product_Name+' (Prod ID: '+convert(varchar, @Shareit_ID)+')' from ICE_Products where Product_ID=@Product_ID)
If ISNULL(@License_TYpe_ID, 0) > 0
set @Result = @Result + Char(13) + Char(10) + (Select License_Type from ICE_License_Types where License_Type_ID=ISNULL(@License_Type_ID, 0)) + ' License'
If ISNULL(@Maintenance_ID, 0) > 0
set @Result = @Result + Char(13) + Char(10) + ' with ' + (Select Maintenance from ICE_Maintenances where Maintenance_ID=ISNULL(@Maintenance_ID, 0)) + ' Support and Upgrades'
return @Result
End


GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailProduct]
	TO [davor.dumeljic]
GO
