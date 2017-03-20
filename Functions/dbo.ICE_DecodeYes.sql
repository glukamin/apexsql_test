SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function dbo.ICE_DecodeYes(@v tinyint)
returns varchar(20)
as
begin
if ISNULL(@v, 0) = 1
	return 'Yes'
return ''
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_DecodeYes]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_DecodeYes]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_DecodeYes]
	TO [davor.dumeljic]
GO
