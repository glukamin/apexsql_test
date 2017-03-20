SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetActivationRatio(@CustId int)
RETURNS float
AS 
BEGIN
	
DECLARE @Remaining float
DECLARE @Activated float
DECLARE @Result float


SET @Remaining = (
	select dbo.ICE_GetRemainingActivations(@CustId))

SET @Activated = (
	select dbo.ICE_GetNoActivations(@CustId))

IF @Activated = 0 AND @Remaining = 0
	RETURN 0
	
SET @Result = (SELECT ROUND(@Activated/(@Activated+ @Remaining)*100, 2))
RETURN @Result
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetActivationRatio]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetActivationRatio]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetActivationRatio]
	TO [davor.dumeljic]
GO
