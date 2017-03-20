SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure dbo.ICE_sp_SalesByUSCanadaVsOthers(@DateBegin datetime, @DateEnd datetime)
as
Select Case dbo.ICE_IsCountryUSCanada(Country) when 1 then 'US or Canada' else 'Others' End as Region, Sum(Total) as Total
from ICE_Orders where Order_Status_ID in (0,1,2,4) and Order_Date >= @DateBegin and Order_Date <= @DateEnd 
Group By Case dbo.ICE_IsCountryUSCanada(Country) when 1 then 'US or Canada' else 'Others' End
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByUSCanadaVsOthers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByUSCanadaVsOthers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByUSCanadaVsOthers]
	TO [davor.dumeljic]
GO
