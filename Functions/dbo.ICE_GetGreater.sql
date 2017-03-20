SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_GetGreater](@a sql_variant, @b sql_variant)
returns sql_variant
as
Begin
if @a > @b
	return @a

return @b
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGreater]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGreater]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetGreater]
	TO [davor.dumeljic]
GO
