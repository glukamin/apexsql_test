SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value

GO
GRANT EXECUTE
	ON [dbo].[dt_getobjwithprop]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_getobjwithprop]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_getobjwithprop]
	TO [davor.dumeljic]
GO
