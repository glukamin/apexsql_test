SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function dbo.ICE_GetProductSupport (@Product_ID int)
returns tinyint
as
Begin
declare @Product_Name varchar(200)
Select @Product_Name = Product_Name from ICE_Products where Product_ID = @Product_ID
if PATINDEX('%+%1%yr%', @Product_Name) > 0
	return 1
else if PATINDEX('%+%2%yr%', @Product_Name) > 0
	return 2	
else if PATINDEX('%+%3%yr%', @Product_Name) > 0
	return 3
return 0
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSupport]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSupport]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductSupport]
	TO [davor.dumeljic]
GO
