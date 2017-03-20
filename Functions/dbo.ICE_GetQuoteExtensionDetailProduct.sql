SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ICE_GetQuoteExtensionDetailProduct](@Extension_Detail_ID int)
returns varchar(200)
as
Begin
declare @Result varchar(200), @Product_ID int, @Extension_Expiry datetime
select @Product_ID=Product_ID, @Extension_Expiry=Extension_Expiry from ICE_Quote_Extension_Details where Extension_Detail_ID=ISNULL(@Extension_Detail_ID, 0)
set @Result = (Select Product_Name+' (Prod ID: '+convert(varchar, Product_ID)+')' from ICE_Products where Product_ID=@Product_ID)
set @Result = @Result + Char(13) + Char(10) + 'Support and Upgrades Renewal'
return @Result
End

GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteExtensionDetailProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteExtensionDetailProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteExtensionDetailProduct]
	TO [davor.dumeljic]
GO
