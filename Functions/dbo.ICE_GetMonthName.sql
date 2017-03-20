SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function dbo.ICE_GetMonthName(@Month int)
returns varchar(20)
as
begin
if(Len(convert(varchar, @Month))<>6)
	return ''
declare @M int, @Y varchar(2)
set @M = convert(int, SUBSTRING(convert(varchar, @Month), 5, 2))
set @Y = SUBSTRING(convert(varchar, @Month), 3, 2)
if @M = 1
	return 'Jan-' + @Y
else if @M = 2
	return 'Feb-' + @Y
else if @M = 3
	return 'Mar-' + @Y
else if @M = 4
	return 'Apr-' + @Y
else if @M = 5
	return 'May-' + @Y
else if @M = 6
	return 'Jun-' + @Y
else if @M = 7
	return 'Jul-' + @Y
else if @M = 8
	return 'Aug-' + @Y
else if @M = 9
	return 'Sep-' + @Y
else if @M = 10
	return 'Oct-' + @Y
else if @M = 11
	return 'Nov-' + @Y
else if @M = 12
	return 'Dec-' + @Y
return ''
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMonthName]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMonthName]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMonthName]
	TO [davor.dumeljic]
GO
