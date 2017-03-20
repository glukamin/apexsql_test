SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE dbo.dt_displayoaerror_u
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      nvarchar(255)
declare @hr             int
declare @vchSource      nvarchar(255)
declare @vchDescription nvarchar(255)

    exec @hr = sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return


GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror_u]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror_u]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[dt_displayoaerror_u]
	TO [davor.dumeljic]
GO
