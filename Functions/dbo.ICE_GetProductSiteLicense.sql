SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function dbo.ICE_GetProductSiteLicense (@Product_ID int)
returns tinyint
as
Begin
declare @Product_Name varchar(200)
Select @Product_Name = Product_Name from ICE_Products where Product_ID = @Product_ID
if PATINDEX('%Site%Lic%', @Product_Name) > 0
	return 1
return 0
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSiteLicense]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSiteLicense]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSiteLicense]
	TO [davor.dumeljic]
GO
