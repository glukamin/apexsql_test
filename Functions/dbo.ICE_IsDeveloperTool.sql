SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_IsDeveloperTool](@Product_ID int)
returns tinyint
as
Begin
return dbo.ICE_IsProductInStudio(@Product_ID, 'D')
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsDeveloperTool]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsDeveloperTool]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsDeveloperTool]
	TO [davor.dumeljic]
GO
