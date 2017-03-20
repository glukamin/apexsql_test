SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[ICE_sp_Orders_For_Renewal]
(
	@ExpirationDateBegin datetime,
	@ExpirationDateEnd datetime
)
AS
BEGIN
	SET @ExpirationDateEnd = @ExpirationDateEnd + ' 23:59:59'

	SELECT 
	O.Order_ID, 	
     OT.Type as Order_Type,
	First_Name_Ship,
	Last_Name_Ship,
     O.Email_Ship,
	O.Company,
	dbo.ICE_GetLicensePrice(OD.Product_ID, OD.License_Type_ID, 1, OD.Qty)*0.25 as Renewal_Cost,
	Order_Date, 
	P.Product_Name,		
	dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) as Expiry_Date,
     (case when exists(select [E-Mail] from Unsubscribed where [E-Mail] = O.Email_Ship and FromMailChimp = 1) then 1 else 0 end) as Unsubscribed
	FROM ICE_Order_Details OD
	INNER JOIN ICE_Orders O on OD.Order_ID = O.Order_ID
	INNER JOIN ICE_Products P on OD.Product_ID = P.Product_ID	
     INNER JOIN ICE_Order_Types OT on O.Order_Type_ID = OT.Order_Type_ID
	WHERE 
	(			
	    dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) between @ExpirationDateBegin and @ExpirationDateEnd		
	) and
	--OD.Maintenance_ID > 0
     dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) <> O.Order_Date
     and O.Order_Status_ID in (0,1,2,3,4)

END	
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Orders_For_Renewal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Orders_For_Renewal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Orders_For_Renewal]
	TO [davor.dumeljic]
GO
