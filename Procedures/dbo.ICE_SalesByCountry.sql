SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ICE_SalesByCountry 
(
	@DateFrom datetime,
	@DateTo datetime
)
AS 
BEGIN	
	SELECT Country_Ship, Product_Name, Sum(O.Total)
	FROM ICE_Orders O
	JOIN ICE_Order_Details OD on O.Order_ID = OD.Order_ID
	JOIN ICE_Products P on OD.Product_ID = P.Product_ID
	WHERE O.Order_Date > @DateFrom and O.Order_Date < @DateTo
	GROUP BY O.Country_Ship, P.Product_Name
	ORDER BY O.Country_Ship, P.Product_Name
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_SalesByCountry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_SalesByCountry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_SalesByCountry]
	TO [davor.dumeljic]
GO
