SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE function [dbo].[ICE_GetProductAbvName](@Product_ID int)
returns varchar(200)
as
Begin
return Replace( Replace( Replace( Replace( Replace( (Select Product_Name from ICE_Products where Product_ID=@Product_ID), ' Maintenance', ''), ' License', ''), 'ApexSQL ', ''), ' Studioz', ''), ' Payment', '')
End

GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductAbvName]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductAbvName]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductAbvName]
	TO [davor.dumeljic]
GO
