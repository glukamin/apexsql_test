SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/*
**	Add an object to the dtproperties table
*/
create procedure dbo.dt_adduserobject
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity

GO
GRANT EXECUTE
	ON [dbo].[dt_adduserobject]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_adduserobject]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_adduserobject]
	TO [davor.dumeljic]
GO
