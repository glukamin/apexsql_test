SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_CustomersWithoutOrders
AS
BEGIN
	SELECT 
	Cust.Cust_ID ,
	Cust.First_Name ,
	Cust.Last_Name ,
	Cust.Email ,	
	Cust.Company ,
	Cust.Phone ,
	Cust.Fax ,
	Cust.Address1 ,   
	Cust.City ,
	Cust.State ,
	Cust.Country ,
	Cust.Zip ,    
	Cust.Create_Date    
	FROM
	ICE_Customers Cust LEFT JOIN ICE_Orders O
	ON Cust.Cust_ID = O.Cust_ID
	WHERE
	O.Cust_ID IS NULL
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersWithoutOrders]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersWithoutOrders]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomersWithoutOrders]
	TO [davor.dumeljic]
GO
