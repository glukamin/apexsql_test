SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[ICE_IsZero](@v float)
returns float
as
begin
if ISNULL(@v, 0) = 0
	return null
return @v
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsZero]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsZero]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsZero]
	TO [davor.dumeljic]
GO
