SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_IsProductBundle](@Product_ID int)
returns tinyint
as
Begin
if Len(ISNULL( (Select Bundle_Products from ICE_Products where Product_ID=@Product_ID), '')) > 0
	return 1
return 0
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductBundle]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductBundle]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductBundle]
	TO [davor.dumeljic]
GO
