SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ICE_sp_SalesByMaintByMonth] 
( 
@DateBegin datetime, 
@DateEnd datetime 
) 
AS 

select 
MaintName = T.Maint,
T.Order_Count 

from 
( 
Select Top 100 percent 
Maint = Maintenance_ID,
Order_Count = count(*)
from 
ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID = ICE_Order_Details.Order_ID 
where 
ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
ICE_Orders.Order_Date >= @DateBegin and 
ICE_Orders.Order_Date <= @DateEnd 

Group by 
Maintenance_ID
) AS T 
Order by 
T.Maint
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintByMonth]
	TO [davor.dumeljic]
GO
