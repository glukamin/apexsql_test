SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[ICE_GetFirstDateOfMonth](@Dated datetime)
returns datetime
as
Begin
return convert(datetime, convert(varchar, year(@Dated))+'-'+convert(varchar, month(@Dated))+'-1')
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDateOfMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDateOfMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDateOfMonth]
	TO [davor.dumeljic]
GO
