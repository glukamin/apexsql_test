SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_MissingFieldsInCustomers
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
    ICE_Customers.Cust_ID ,
    ICE_Customers.First_Name ,
    ICE_Customers.Last_Name ,
    ICE_Customers.Email ,    
    ICE_Customers.Company ,
    ICE_Customers.Phone ,
    ICE_Customers.Fax ,
    ICE_Customers.Address1 ,    
    ICE_Customers.City ,
    ICE_Customers.State ,
    ICE_Customers.Country ,
    ICE_Customers.Zip ,    
    ICE_Customers.Create_Date
FROM
    ICE_Customers
WHERE ICE_Customers.Create_Date between ''' + CONVERT(varchar(30), @StartDate) + ''' and ''' + CONVERT(varchar(30), @EndDate) + ''''

If @Condition = 'City'
	SET @sql = @sql + ' and (City is NULL or Len(City) = 0)' 
If @Condition = 'State'
	SET @sql = @sql + ' and (State is NULL or Len(State) = 0)' 
If @Condition = 'Zip'
	SET @sql = @sql + ' and (Zip is NULL or Len(Zip) = 0)' 
EXECUTE sp_executesql @sql
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInCustomers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInCustomers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInCustomers]
	TO [davor.dumeljic]
GO
