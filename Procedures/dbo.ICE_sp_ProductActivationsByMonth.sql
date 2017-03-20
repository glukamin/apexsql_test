SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[ICE_sp_ProductActivationsByMonth](@ProductID int, @DateBegin datetime, @DateEnd datetime)
as


Select top 100 percent 
dbo.ICE_GetMonthName(Year(ICE_Activations.Process_Date) * 100 + Month(ICE_Activations.Process_Date)) as [Month], 
Count(*) as Activations 

from ICE_Activations 

inner join ICE_Unlock_Codes on ICE_Activations.Unlock_Code_ID=ICE_Unlock_Codes.Unlock_Code_ID 
inner join ICE_Products on ICE_Unlock_Codes.Product_ID=ICE_Products.Product_ID 

where 

ICE_Unlock_Codes.Product_ID= @ProductID and 
Process_Date >= @DateBegin and 
Process_Date < @DateEnd And 
ISNULL(Failed, 0)=0 And 
ISNULL(Reactivation, 0)=0 

Group by Year(Process_Date) * 100 + Month(Process_Date) 
order by Year(Process_Date) * 100 + Month(Process_Date)





GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductActivationsByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductActivationsByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductActivationsByMonth]
	TO [davor.dumeljic]
GO
