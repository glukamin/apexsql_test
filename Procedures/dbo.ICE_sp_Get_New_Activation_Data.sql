SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[ICE_sp_Get_New_Activation_Data]
	@Email varchar(100)
AS
BEGIN
	
SELECT iah.Email, 
iah.OrderID, 
iah.NoLicences, 
iuc.Product_ID, 
ISNULL(iuc.Unlock_Code,''), 
(dbo.ICE_GetEligableVersion(iuc.Order_Detail_ID,iuc.Product_ID)) AS EligableVersion 
FROM dbo.ICE_Activation_Helper iah
inner join dbo.ICE_Unlock_Codes iuc ON iuc.Order_ID = iah.OrderID
 WHERE iah.Email LIKE @Email
END
GO
