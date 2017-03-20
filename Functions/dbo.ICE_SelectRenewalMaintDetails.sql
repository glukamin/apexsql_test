SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_SelectRenewalMaintDetails_TEMP] (@Order_ID int, @Today datetime)
returns table
as
return Select T.Order_ID, T.FirstName, T.LastName, T.Email,T.ProductName, 
           AreOrderDetailsSameQuantityMaintenance = dbo.ICE_AreOrderDetailsSameQuantityMaintenance(T.Order_ID),
           IsOrderMaintAlreadyExpired = Max(T.IsOrderMaintAlreadyExpired), ---1 free upgrades, 0 - under maint, 1 - expired
           ExpirationDate = Min(T.ExpirationDate),
           GracePeriodEndDate = Min(T.GracePeriodEndDate),
           CanCustomerUpgradeToDevStudio = Min(T.CanCustomerUpgradeToDevStudio),
           CanCustomerUpgradeToUnivStudio = Min(T.CanCustomerUpgradeToUnivStudio),
           MaintCost1y = Sum(T.MaintCost1y),
           MaintCost2y = Sum(T.MaintCost2y),
           MaintCost3y = Sum(T.MaintCost3y),
           UpgradeDevStudioPrice1yr  = dbo.ICE_GetGreater( Max(T.LicensePriceDevStudio1yr) - ROUND(Min(T.TotalRecieved) - Sum(T.CDChargeRecieved), 0), 100.0),
           UpgradeDevStudioPrice2yr  = dbo.ICE_GetGreater( Max(T.LicensePriceDevStudio2yr) - ROUND(Min(T.TotalRecieved) - Sum(T.CDChargeRecieved), 0), 100.0),
           UpgradeDevStudioPrice3yr  = dbo.ICE_GetGreater( Max(T.LicensePriceDevStudio3yr) - ROUND(Min(T.TotalRecieved) - Sum(T.CDChargeRecieved), 0), 100.0),
           UpgradeUnivStudioPrice2yr  = dbo.ICE_GetGreater( Max(T.LicensePriceUnivStudio2yr) - ROUND(Min(T.TotalRecieved) - Sum(T.CDChargeRecieved), 0), 100.0),
           UpgradeUnivStudioPrice3yr  = dbo.ICE_GetGreater( Max(T.LicensePriceUnivStudio3yr) - ROUND(Min(T.TotalRecieved) - Sum(T.CDChargeRecieved), 0), 100.0),
		   TotalRecieved = Min(T.TotalRecieved)
           From
           (Select Order_ID = O.Order_ID, FirstName = O.First_Name_Ship, LastName = O.Last_Name_Ship, Email = O.Email_Ship, ProductName = P.Product_Name,
               IsOrderMaintAlreadyExpired =   CASE WHEN ISNULL((Select Free_Upgrades from ICE_Orders where Order_ID=@Order_ID), 0)=1 Then -1 WHEN dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID) < @Today THEN 1 ELSE 0 END,
               ExpirationDate = CONVERT(Varchar(20), dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID), 107),
               GracePeriodEndDate = CONVERT(Varchar(20), CASE dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID) WHEN convert(datetime, '12/31/9999 11:59 PM') THEN convert(datetime, '12/31/9999 11:59 PM') ELSE DATEADD(m, 1, dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_ID)) END, 107),
               CanCustomerUpgradeToDevStudio = dbo.ICE_IsProductInStudio(OD.Product_ID, 'D'),
               CanCustomerUpgradeToUnivStudio = dbo.ICE_IsProductInStudio(OD.Product_ID, 'U'),
               MaintCost1y = dbo.ICE_GetExtensionPrice(OD.Product_ID, OD.License_Type_ID, @Today, DATEADD(yy, 1, @Today), OD.Qty) * OD.Qty,
               MaintCost2y = dbo.ICE_GetExtensionPrice(OD.Product_ID, OD.License_Type_ID, @Today, DATEADD(yy, 2, @Today), OD.Qty) * OD.Qty,
               MaintCost3y = dbo.ICE_GetExtensionPrice(OD.Product_ID, OD.License_Type_ID, @Today, DATEADD(yy, 3, @Today), OD.Qty) * OD.Qty,
               LicensePriceDevStudio1yr = ( dbo.ICE_GetLicensePrice(141582, OD.License_Type_ID, 0, OD.Qty) * OD.Qty ),
               LicensePriceDevStudio2yr = ( dbo.ICE_GetLicensePrice(141582, OD.License_Type_ID, 1, OD.Qty) * OD.Qty ),
               LicensePriceDevStudio3yr = ( dbo.ICE_GetLicensePrice(141582, OD.License_Type_ID, 2, OD.Qty) * OD.Qty ),
               LicensePriceUnivStudio2yr = ( dbo.ICE_GetLicensePrice(204978, OD.License_Type_ID, 1, OD.Qty) * OD.Qty ),
               LicensePriceUnivStudio3yr = ( dbo.ICE_GetLicensePrice(204978, OD.License_Type_ID, 2, OD.Qty) * OD.Qty),
               TotalRecieved = ISNULL(O.Total, 0),
               CDChargeRecieved = ISNULL(OD.CDCharge, 0)
               FROM
               ICE_Order_Details AS OD INNER JOIN
			   ICE_Products AS P ON
			   OD.Product_Id = P.product_Id INNER JOIN
               ICE_Orders AS O ON OD.Order_Id = O.Order_ID
               WHERE
               OD.Order_ID = @Order_ID
               ) T Group by T.Order_ID, T.FirstName, T.LastName, T.Email, T.ProductName
GO
GRANT SELECT
	ON [dbo].[ICE_SelectRenewalMaintDetails]
	TO [adrijan.bandu]
GO
GRANT SELECT
	ON [dbo].[ICE_SelectRenewalMaintDetails]
	TO [davor.dumeljic]
GO
