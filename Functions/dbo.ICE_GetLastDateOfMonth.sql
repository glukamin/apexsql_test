SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[ICE_GetLastDateOfMonth](@Dated datetime)
returns datetime
as
Begin
set @Dated = DATEADD(m, 1, @Dated)
return convert(datetime, convert(varchar, year(@Dated))+'-'+convert(varchar, month(@Dated))+'-1') - 1
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDateOfMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDateOfMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDateOfMonth]
	TO [davor.dumeljic]
GO
