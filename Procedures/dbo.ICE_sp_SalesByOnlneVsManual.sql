SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure dbo.ICE_sp_SalesByOnlneVsManual(@DateBegin datetime, @DateEnd datetime)
as
Select Case Order_Type_ID when 1 then 'Online' else 'Manual' End as Type, Sum(Total) as Total
from ICE_Orders where Order_Status_ID in (0,1,2,4) and Order_Date >= @DateBegin and Order_Date <= @DateEnd 
Group By Case Order_Type_ID when 1 then 'Online' else 'Manual' End
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByOnlneVsManual]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByOnlneVsManual]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByOnlneVsManual]
	TO [davor.dumeljic]
GO
