SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function dbo.ICE_IsCountryUSCanada(@Country varchar(200))
returns tinyint
as
Begin
if @Country Like 'USA' or @Country Like 'UNITED STATES' or @Country Like 'CANADA'
	return 1
return 0
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCountryUSCanada]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCountryUSCanada]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsCountryUSCanada]
	TO [davor.dumeljic]
GO
