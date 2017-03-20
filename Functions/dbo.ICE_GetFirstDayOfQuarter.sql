SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Dragan Radivojevic
-- Create date: 12/30/2009
-- Description:	Get first day of a quarter
-- =============================================
CREATE FUNCTION [dbo].[ICE_GetFirstDayOfQuarter]
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
		IF MONTH(@Date) = 1
			--If calculated in january first day of the first quarter is in the previous year
			SET @Result = '11/01/' + CONVERT(varchar(4), YEAR(@Date) - 1)
		ELSE
			SET @Result = '11/01/' + CONVERT(varchar(4), YEAR(@Date))
	IF @Quarter = 2
		SET @Result = '02/01/' + CONVERT(varchar(4), YEAR(@Date))
	IF @Quarter = 3
		SET @Result = '05/01/' + CONVERT(varchar(4), YEAR(@Date)) 
	IF @Quarter = 4
		SET @Result = '08/01/' + CONVERT(varchar(4), YEAR(@Date)) 
	RETURN @Result
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDayOfQuarter]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDayOfQuarter]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetFirstDayOfQuarter]
	TO [davor.dumeljic]
GO
