SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure dbo.dt_getpropertiesbyid_vcs
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs]
	TO [davor.dumeljic]
GO
