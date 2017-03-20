SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Customers_details]
(
      @First_Name varchar(100) = 'asdf987as9d0f87a',
      @Last_Name varchar(100) = 'asdf987as9d0f87a', 
      @Email varchar(100) = 'asdf987as9d0f87a',
      @Company varchar(100) = 'asdf987as9d0f87a'
)
AS
BEGIN 
      SELECT 
	   ic.First_Name,
	   ic.Last_Name,
	   ic.Email,
	   ior.Order_Date,
	   (SELECT ip.Product_Name FROM dbo.ICE_Products ip WHERE ip.Product_ID = iod.Product_ID) AS product,
	   iod.Expiry_Date
	   FROM dbo.ICE_Customers ic
	   INNER JOIN dbo.ICE_Orders ior ON ior.Cust_ID = ic.Cust_ID
	   INNER JOIN dbo.ICE_Order_Details iod ON iod.Order_ID = ior.Order_ID
	   WHERE ic.Email LIKE @Email OR ic.First_Name LIKE @First_Name OR ic.Last_Name LIKE @Last_Name OR ic.Company LIKE @Company
END
GO
