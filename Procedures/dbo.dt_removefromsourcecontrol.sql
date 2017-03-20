SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create procedure dbo.dt_removefromsourcecontrol

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0



GO
GRANT EXECUTE
	ON [dbo].[dt_removefromsourcecontrol]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_removefromsourcecontrol]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_removefromsourcecontrol]
	TO [davor.dumeljic]
GO
