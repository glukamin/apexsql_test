SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

/*
**	This procedure returns the version number of the stored
**    procedures used by the Microsoft Visual Database Tools.
**    Current version is 7.0.00.
*/
create procedure dbo.dt_verstamp006
as
	select 7000

GO
GRANT EXECUTE
	ON [dbo].[dt_verstamp006]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_verstamp006]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_verstamp006]
	TO [davor.dumeljic]
GO
