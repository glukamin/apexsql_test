SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VIP_GetNumOfDaysInMonth]
(
	@Month int
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SET @Result = 0
	IF @Month in (1,3,5,7,8,10,12)
		SET @Result = 31
	IF @Month in (4,6,9,11)
		SET @Result = 30
	IF @Month = 2
		SET @Result	= 28
	IF @Month < 1 OR @Month > 12
		SET @Result = 0		
	RETURN @Result	
END

GO
GRANT EXECUTE
	ON [dbo].[VIP_GetNumOfDaysInMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetNumOfDaysInMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetNumOfDaysInMonth]
	TO [davor.dumeljic]
GO
