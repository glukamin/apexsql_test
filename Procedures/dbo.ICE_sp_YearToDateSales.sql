SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_YearToDateSales]
AS

Select * from (

Select 
	Year = convert(varchar, Year(GetDate())),
	Total = convert(varchar, convert(money, Sum(ROUND(Total, 0))), 1), 
	Extrapolate = convert
					(
					varchar, 
					convert
						(
						money, 
						Round(Sum(Total)* 365.25 / DateDiff(d, convert
										(
										datetime, 
										convert(varchar, Year(GetDate()))+'-1-1'), GetDate()), 
										2
										)
						), 
					1
					)
from 
	ICE_Orders 
	
where 
	Order_Status_ID in (0,1,2,4) and 
	Order_Date >= convert(datetime, convert(varchar, Year(GetDate()))+'-1-1') and 
	Order_Date < convert(datetime, convert(varchar, Year(GetDate() + 1))+'-'+convert(varchar, Month(GetDate() + 1))+'-'+convert(varchar, Day(GetDate() + 1)))

UNION ALL

Select 
	Year = convert(varchar, Year(GetDate())-1),
	Total = convert(varchar, convert(money, Sum(ROUND(Total, 0))), 1), 
	Extrapolate = convert
					(
					varchar, 
					convert
						(
						money, 
						Round(Sum(Total)* 365.25 / DateDiff(d, convert
										(
										datetime, 
										convert(varchar, Year(GetDate()))+'-1-1'), GetDate()), 
										2
										)
						), 
					1
					)
from 
	ICE_Orders 
	
where 
	Order_Status_ID in (0,1,2,4) and 
	Order_Date >= convert(datetime, convert(varchar, Year(GetDate())-1)+'-1-1') and 
	Order_Date < convert(datetime, convert(varchar, Year(GetDate() + 1)-1)+'-'+convert(varchar, Month(GetDate() + 1))+'-'+convert(varchar, Day(GetDate() + 1)))

) T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_YearToDateSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_YearToDateSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_YearToDateSales]
	TO [davor.dumeljic]
GO
