SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_MissingFieldsInOrders
(
	@StartDate datetime,
	@EndDate datetime,
	@Condition varchar(30)	
)
AS 
BEGIN

DECLARE @sql nvarchar(max)

set @sql = '
select [Order_ID],
	[Order_Date],
	[Cust_ID],	
	[Total],	
	[License_To],
	[Reg_Name],
	[Notes],	
	[Last_Name_Ship],
	[First_Name_Ship],
	[Email_Ship],
	[Company_Ship],
	[Phone_Ship],
	[Fax_Ship],
	[Address1_Ship],	
	[City_Ship],
	[State_Ship],
	[Country_Ship],
	[Zip_Ship]
from ICE_Orders
where ICE_Orders.Order_Status_ID in (1,2,4) and
ICE_Orders.Order_Date between ''' + CONVERT(varchar(30), @StartDate) + ''' and ''' + CONVERT(varchar(30), @EndDate) + ''''

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
	ON [dbo].[ICE_sp_MissingFieldsInOrders]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInOrders]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MissingFieldsInOrders]
	TO [davor.dumeljic]
GO
