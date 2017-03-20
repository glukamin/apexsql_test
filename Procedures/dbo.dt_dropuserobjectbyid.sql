SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure dbo.dt_dropuserobjectbyid
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id

GO
GRANT EXECUTE
	ON [dbo].[dt_dropuserobjectbyid]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_dropuserobjectbyid]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_dropuserobjectbyid]
	TO [davor.dumeljic]
GO
