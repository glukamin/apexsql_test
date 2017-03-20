SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetQuarterYear
(
	@Date datetime
)
RETURNS int
AS
BEGIN
	DECLARE @Result int	
	IF MONTH(@Date) = 11 OR MONTH(@Date) = 12
		SET @Result = YEAR(@Date) + 1
	ELSE
		SET @Result = YEAR(@Date)
	RETURN @Result	
END	

GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterYear]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterYear]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuarterYear]
	TO [davor.dumeljic]
GO
