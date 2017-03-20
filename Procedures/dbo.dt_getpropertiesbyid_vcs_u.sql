SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure dbo.dt_getpropertiesbyid_vcs_u
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select uvalue
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs_u]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs_u]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_getpropertiesbyid_vcs_u]
	TO [davor.dumeljic]
GO
