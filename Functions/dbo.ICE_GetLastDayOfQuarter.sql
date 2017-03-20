SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:	Dragan Radivojevic
-- Create date: 05/13/2009
-- Description:	Get Last day of a quarter
-- =============================================
CREATE FUNCTION [dbo].[ICE_GetLastDayOfQuarter]
(
	@Date datetime
)
RETURNS datetime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result datetime
	DECLARE @Quarter int
	SET @Quarter = dbo.ICE_Quarter(@Date)
	
	IF @Quarter = 1
		IF Month(@Date) = 11 OR MONTH(@Date) = 12
			--If calculated in nov or dec last day of the first quarter is in the next year
			SET @Result = '01/31/' + CONVERT(varchar(4), YEAR(@Date) + 1) + ' 23:59:59'
		ELSE
			SET @Result = '01/31/' + CONVERT(varchar(4), YEAR(@Date)) + ' 23:59:59'
	IF @Quarter = 2
		SET @Result = '04/30/' + CONVERT(varchar(4), YEAR(@Date)) + ' 23:59:59'
	IF @Quarter = 3
		SET @Result = '07/31/' + CONVERT(varchar(4), YEAR(@Date)) + ' 23:59:59'		
	IF @Quarter = 4
		SET @Result = '10/31/' + CONVERT(varchar(4), YEAR(@Date)) + ' 23:59:59'
	RETURN @Result
END



GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDayOfQuarter]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDayOfQuarter]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLastDayOfQuarter]
	TO [davor.dumeljic]
GO
