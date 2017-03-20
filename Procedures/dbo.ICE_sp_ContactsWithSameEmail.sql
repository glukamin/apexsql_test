SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_ContactsWithSameEmail
AS
BEGIN
SELECT
    ICE_Contacts.Contact_ID ,
    ICE_Contacts.Cust_ID ,
    ICE_Contacts.Last_Name_Ship ,
    ICE_Contacts.First_Name_Ship ,
    ICE_Contacts.Email_Ship ,
    ICE_Contacts.Phone_Ship ,
    ICE_Contacts.Fax_Ship ,
    ICE_Contacts.Address1_Ship ,    
    ICE_Contacts.City_Ship ,
    ICE_Contacts.State_Ship ,
    ICE_Contacts.Country_Ship ,
    ICE_Contacts.Zip_Ship ,
    ICE_Contacts.Is_active01 ,    
    ICE_Contacts.Create_Date    
FROM
    ICE_Contacts
where ICE_Contacts.Email_Ship in
(
	select Email_Ship
	from ICE_Contacts
	group by Email_Ship
	having Count(*) > 1
)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ContactsWithSameEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ContactsWithSameEmail]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ContactsWithSameEmail]
	TO [davor.dumeljic]
GO
