SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE   [dbo].[ICE_sp_GetActivationKeys2]
	@Email varchar(100)
AS
BEGIN
	DECLARE @CustID int
	SET @CustID = (SELECT top 1 Cust_ID FROM ICE_Contacts WHERE Email_Ship like @Email)

	SELECT I.Activation_Blocked as I_Activation_Blocked, 
			I.Activation_Counter as I_Activation_Counter, 
			I.License_No as I_License_No, 
			I.Order_Detail_ID as I_Order_Detail_ID, 
			I.Order_ID as I_Order_ID, 
			I.Product_ID as I_Product_ID, 
			I.Unlock_Code as Activation_Key,
			I.Unlock_Code_ID as I_Unlock_Code_ID,
			OD.License_Type_ID, 
			I1.Order_ID as I1_Order_ID,
			CONVERT(varchar(20),I1.Order_Date,101) as OrderDate,
			I1.Reg_Name as I1_Reg_Name,
			I2.Product_ID as I2_Product_ID,
			I2.Product_Name as Product, 
			P.Product_Name as Product2,
			I3.Status as I3_Status,
			(CASE 
				WHEN P.Bundle_Products is null THEN 0
				ELSE 1
			END) as IsBundle,
			CONVERT(varchar(20), dbo.ICE_GetOrderDetailExpiry(I.Order_Detail_ID),101) AS ExpirationDate,
			P.Product_ID as Product_ID,
			dbo.ICE_GetEligableVersion(I.Order_Detail_ID,I2.Product_ID) AS EligableVersion    
			FROM ICE_Unlock_Codes I, ICE_Orders I1, ICE_Products I2, ICE_Order_Status I3, ICE_Order_Details OD, ICE_Products P 
			WHERE I1.Order_ID=I.Order_ID and 
				  I2.Product_ID=I.Product_ID and 
				  I1.Order_Status_ID=I3.Order_Status_ID and 
				  I.Order_Detail_ID = OD.Order_Detail_Id and 
				  OD.Product_ID = P.Product_ID and 
				  (I.Activation_Blocked is null or I.Activation_Blocked = 0) AND (I1.Order_Status_ID > 0) AND EXISTS(SELECT * FROM ICE_Contacts where ICE_Contacts.Email_Ship = @Email and ICE_Contacts.Is_active01='Y')  AND ( I1.Cust_ID = @CustID)  
				  ORDER BY IsBundle, OrderDate, I1_Order_ID, Product_ID, I_License_No, Product
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetActivationKeys2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetActivationKeys2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetActivationKeys2]
	TO [davor.dumeljic]
GO
