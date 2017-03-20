SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE dbo.ICE_GetMaintRenewalEmailData (@OrderDetailId int)
AS
BEGIN

SELECT
	[FirstName] = O.First_Name,  
	[Email] = O.Email_Ship,  
	[IsOrderMaintAlreadyExpired] = 	CASE 
		WHEN dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID) < GetDate() THEN  
	  		1  
	 	ELSE 
			0  
		END,  	
	[ExpirationDate] = CONVERT(Varchar(20), dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID), 107), 
	[GracePeriodEndDate] = CONVERT(
		Varchar(20), 
		DATEADD(d, 30, dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID)),
		107
		),
	[CanCustomerUpgradeToDevStudio] = dbo.ICE_CanCustomerUpgradeToDevStudio(O.Order_ID),  
	[CanCustomerUpgradeToUnivStudio] = dbo.ICE_CanCustomerUpgradeToUnivStudio(O.Order_ID),  
	[MaintCost1y] = CONVERT(DECIMAL(10, 2), 1 * 0.25 * P.Price),  
	[MaintCost2y] = CONVERT(DECIMAL(10, 2), 2 * 0.20 * P.Price),  
	[MaintCost3y] = CONVERT(DECIMAL(10, 2), 3 * 0.15 * P.Price),  
	
	[DevStudioCreditByCustomer] = dbo.ICE_StudioCreditByCustomer(O.Email_Ship, 'D'),
	[UnivStudioCreditByCustomer] = dbo.ICE_StudioCreditByCustomer(O.Email_Ship, 'U'),

	[DevStudioPrice]  = (SELECT Price FROM ICE_Products WHERE Product_Id = 141582),
	[UnivStudioPrice] = (SELECT Price FROM ICE_Products WHERE Product_Id = 204978)
	
FROM  
	ICE_Order_Details AS OD LEFT OUTER JOIN 
	ICE_Orders AS O ON OD.Order_Id = O.Order_ID LEFT OUTER JOIN
	ICE_Products AS P ON OD.Product_ID = P.Product_ID

WHERE
	OD.Order_Detail_ID = @OrderDetailId

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintRenewalEmailData]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintRenewalEmailData]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintRenewalEmailData]
	TO [davor.dumeljic]
GO
