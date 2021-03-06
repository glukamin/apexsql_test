SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE dbo.dt_displayoaerror
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return


GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror]
	TO [davor.dumeljic]
GO
