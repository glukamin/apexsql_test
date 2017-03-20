SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property

GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid]
	TO [davor.dumeljic]
GO
