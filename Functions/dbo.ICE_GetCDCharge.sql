SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function dbo.ICE_GetCDCharge(@CD tinyint)
returns money
as
Begin
declare @CDCharge money
if ISNULL(@CD, 0) = 0
	set @CDCharge = NULL
else
	set @CDCharge = (Select CDCharge from ICE_Configurations where ID=1)
return @CDCharge
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCDCharge]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCDCharge]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetCDCharge]
	TO [davor.dumeljic]
GO
