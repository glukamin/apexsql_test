SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_MissingFieldsInContacts
(
	@StartDate datetime,
	@EndDate datetime,
	@Condition varchar(30)	
)
AS 
BEGIN

DECLARE @sql nvarchar(max)

set @sql = '
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
    ICE_Contacts.Create_Date ,
    ICE_Contacts.Edited_By ,    
    ICE_Contacts.Notes
FROM
    ICE_Contacts
WHERE ICE_Contacts.Create_Date between ''' + CONVERT(varchar(30), @StartDate) + ''' and ''' + CONVERT(varchar(30), @EndDate) + ''''

If @Condition = 'City'
	SET @sql = @sql + ' and (City_Ship is NULL or Len(City_Ship) = 0)' 
If @Condition = 'State'
	SET @sql = @sql + ' and (State_Ship is NULL or Len(State_Ship) = 0)' 
If @Condition = 'Zip'
	SET @sql = @sql + ' and (Zip_Ship is NULL or Len(Zip_Ship) = 0)' 

EXECUTE sp_executesql @sql

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInContacts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInContacts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInContacts]
	TO [davor.dumeljic]
GO
