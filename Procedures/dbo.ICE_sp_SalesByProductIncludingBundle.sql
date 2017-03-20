SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SalesByProductIncludingBundle]
(
	@DateBegin	datetime, 
	@DateEnd	datetime
)
AS
SET @DateEnd = DATEADD(day,1, @DateEnd )
SELECT
	Product_Name = dbo.ICE_GetProductAbvName(T.Product_ID),
	Total = Sum(Total)
	
FROM
(
	SELECT 
		Product_ID = ICE_Order_Details.Product_ID,
		Total = SUM(ROUND
				(
					ICE_Order_Details.Total * 
					(1 - (ISNULL(ICE_Orders.Discount, 0)/100)), 0)
				)
	FROM 
		ICE_Orders INNER JOIN 
		ICE_Order_Details ON ICE_Orders.Order_ID = ICE_Order_Details.Order_ID INNER JOIN 
		ICE_Products ON ICE_Order_Details.Product_ID = ICE_Products.Product_ID 
		
	WHERE 
		ICE_Orders.Order_Status_ID IN (0, 1, 2, 4) AND 
		ICE_Orders.Order_Date >= @DateBegin AND 
		ICE_Orders.Order_Date <= @DateEnd 
		--AND ISNULL(ICE_Products.Is_Private, 0) = 0
		
	GROUP BY 
		ICE_Order_Details.Product_ID
		
		
	UNION ALL
	
	
	SELECT
		ICE_Extension_Details.Product_ID,
		Total = SUM(ROUND
				(
					ICE_Extension_Details.Total * 
					(1 - (ISNULL(ICE_Orders.Discount, 0)/100)), 0)
				)
	FROM 
		ICE_Orders INNER JOIN 
		ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID INNER JOIN 
		ICE_Products ON ICE_Extension_Details.Product_ID = ICE_Products.Product_ID 
		
	WHERE
		ICE_Orders.Order_Status_ID IN (0, 1, 2, 4) AND 
		ICE_Orders.Order_Date >= @DateBegin AND 
		ICE_Orders.Order_Date <= @DateEnd 
		--AND ISNULL(ICE_Products.Is_Private, 0) = 0
	
	GROUP BY
		ICE_Extension_Details.Product_ID
) AS T

GROUP BY
	T.Product_ID 
	
ORDER BY 
	dbo.ICE_GetProductAbvName(T.Product_ID)
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductIncludingBundle]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductIncludingBundle]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductIncludingBundle]
	TO [davor.dumeljic]
GO
