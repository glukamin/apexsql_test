SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ICE_sp_OrdersByEmail
(
	@Email nvarchar(50)
)
AS
BEGIN
SELECT P.Product_Name, O.Order_Date, O.First_Name_Ship, O.Last_Name_Ship, O.Company_Ship, dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) as [Expiry_Date]
FROM ICE_Orders O
LEFT JOIN ICE_Order_Details OD on O.Order_ID = OD.Order_ID
LEFT JOIN ICE_Products P on OD.Product_ID = P.Product_ID
WHERE O.Email_Ship LIKE '%' + @Email
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_OrdersByEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_OrdersByEmail]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_OrdersByEmail]
	TO [davor.dumeljic]
GO
