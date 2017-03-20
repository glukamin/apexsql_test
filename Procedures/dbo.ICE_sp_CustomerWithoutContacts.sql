SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_CustomerWithoutContacts
AS
BEGIN
	SELECT  [Cust_ID],
		[First_Name],
		[Last_Name],
		[Email],	
		[Company],
		[Phone],	
		[Address1],	
		[City],
		[State],
		[Country],	
		[Create_Date]
	FROM 
	ICE_Customers 
	WHERE ICE_Customers.Cust_ID in
	(
		SELECT DISTINCT Cust.Cust_ID AS Cust_ID
		FROM ICE_Customers Cust left join ICE_Contacts Cont ON Cust.Cust_ID = Cont.Cust_ID
		WHERE Cont.Cust_ID is null
	)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomerWithoutContacts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomerWithoutContacts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_CustomerWithoutContacts]
	TO [davor.dumeljic]
GO
