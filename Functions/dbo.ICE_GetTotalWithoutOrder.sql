SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ICE_GetTotalWithoutOrder]
(
	@Order_ID int
)
returns money
As
BEGIN
    DECLARE @ResultPrice money
	
	SET @ResultPrice = ISNULL((SELECT ISNULL((SELECT io.Total FROM dbo.ICE_Orders io WHERE io.Order_ID = @Order_ID) - SUM(b.Total) , 0) AS Totalis
	FROM dbo.ICE_Order_Details b
	INNER JOIN dbo.ICE_Orders a 
	ON a.Order_ID = b.Order_ID
	WHERE a.Order_ID = @Order_ID
	GROUP BY b.Order_ID),0)

    return @ResultPrice	
END
GO
