SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dragan Radivojevic
-- Create date: 05/13/2009
-- Description:	Gets sum of all sales 
-- =============================================
CREATE FUNCTION [dbo].[ICE_GetTotalSales]
(
	@DateBegin datetime,
	@DateEnd datetime
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result money

	SET @Result = ( SELECT convert(money, Sum(ROUND(Total, 0)))
					FROM ICE_Orders 	
					WHERE
						Order_Status_ID in (0, 1, 2, 4) and 
						Order_Date >= @DateBegin and 
						Order_Date <= @DateEnd )
	RETURN @Result					

END

GO
GRANT EXECUTE
	ON [dbo].[ICE_GetTotalSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetTotalSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetTotalSales]
	TO [davor.dumeljic]
GO
