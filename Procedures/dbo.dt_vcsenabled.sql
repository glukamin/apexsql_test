SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

create proc dbo.dt_vcsenabled

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */



GO
GRANT EXECUTE
	ON [dbo].[dt_vcsenabled]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_vcsenabled]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_vcsenabled]
	TO [davor.dumeljic]
GO
