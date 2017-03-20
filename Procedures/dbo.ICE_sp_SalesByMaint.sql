SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[ICE_sp_SalesByMaint]	
( 
@DateBegin datetime, 
@DateEnd datetime 
) 
AS 


	select
		Month,
		T.Total
	from
	(
		Select Top 100 percent
		Month = '1 Year Maint',
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))

		from
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID

		where
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
		ICE_Orders.Order_Date >= @DateBegin and
		ICE_Orders.Order_Date <= @DateEnd and ICE_Extension_Details.Maintenance_ID = 1

		Group by
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)

		

	) AS T


	UNION ALL

	select
	Month,
	K.Total

	from
	(
		Select Top 100 percent
		Month = '2 Year Maint',
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))

		from
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID

		where
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
		ICE_Orders.Order_Date >= @DateBegin and
		ICE_Orders.Order_Date <= @DateEnd and ICE_Extension_Details.Maintenance_ID = 2

		Group by
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)


	) AS K

	UNION ALL

	select
	Month,
	M.Total

	from
	(
		Select Top 100 percent
		Month = '3 Year Maint',
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))

		from
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID

		where
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
		ICE_Orders.Order_Date >= @DateBegin and
		ICE_Orders.Order_Date <= @DateEnd and ICE_Extension_Details.Maintenance_ID = 3

		Group by
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)

		
	) AS M











GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaint]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaint]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaint]
	TO [davor.dumeljic]
GO
