SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[ICE_sp_RenewalNumber] 
(
	@DateBegin datetime,
    @DateEnd datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;

	CREATE TABLE #NumberOfRenewals (Month int, NumberSection float)
	INSERT INTO #NumberOfRenewals 

	SELECT T.Month, T.Total 
	FROM
	( 
		Select Top 100 percent 
		Total = Count( * ),
		Month = Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
		FROM 
		ICE_Orders --inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID 
		where 
		ICE_Orders.Order_ID IN 
			( 
				SELECT DISTINCT ICE_Orders.Order_ID 
				FROM ICE_Orders 
				INNER JOIN ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
				WHERE 
				ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
				ICE_Orders.Order_Date >= @DateBegin and
				ICE_Orders.Order_Date <= @DateEnd 
				and dbo.ICE_IsEarlyRenewal(ICE_Extension_Details.Extension_Order_Detail_ID) = 1

			)
		GROUP BY		
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
		order by 
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
	) AS T

	CREATE TABLE #NumberForRenewal (Month int, NumberSection float)	
	INSERT INTO #NumberForRenewal

	SELECT P.Month, Count(*) 		
		FROM 			
		(
			SELECT TOP 100 PERCENT 
			Month = Year(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) * 100 + Month(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)), 
			Total = Count(ICE_Order_Details.Order_ID)
			FROM ICE_Order_Details 
			WHERE 
				dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id) >= @DateBegin and 
				dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id) <= @DateEnd and
				ICE_Order_Details.Maintenance_ID > 0
			GROUP BY 
				Year(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) * 100 + Month(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)), ICE_Order_Details.Order_ID 
			ORDER BY		
				Year(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) * 100 + Month(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) 			 			
		) AS P	 
		GROUP BY P.Month
	
	CREATE TABLE #EarnedFromRenewals (Month int, NumberSection float)
	INSERT INTO #EarnedFromRenewals	
	SELECT Z.Month, Z.Total	
	FROM
	(
		SELECT TOP 100 PERCENT 
		Month = Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date),
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))
		FROM ICE_Orders
		WHERE
		ICE_Orders.Order_ID IN 
			( 
				SELECT DISTINCT ICE_Orders.Order_ID 
				FROM ICE_Orders 
				INNER JOIN ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
				WHERE 
				ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
				ICE_Orders.Order_Date >= @DateBegin and
				ICE_Orders.Order_Date <= @DateEnd
			)
		GROUP BY
			Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
		ORDER BY
			Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
	) AS Z

	CREATE TABLE #MaxEarnedFromRenewals (Month int, NumberSection float)
	INSERT INTO #MaxEarnedFromRenewals
	SELECT F.Month, Sum(F.Price)
	FROM
	(
		SELECT TOP 100 PERCENT
		Price = dbo.ICE_GetLicensePriceEnterpriceForRenewal(Product_ID, License_Type_ID,ICE_Order_Details.Order_Detail_Id, 1, Qty)*0.25 ,
		Month = Year(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) * 100 + Month(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id))
		FROM ICE_Order_Details
		WHERE
		dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id) >= @DateBegin and
		dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id) <= @DateEnd and
		ICE_Order_Details.Maintenance_ID > 0
		ORDER BY
			Year(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id)) * 100 + Month(dbo.ICE_GetOrderDetailExpiry(ICE_Order_Details.Order_Detail_Id))
	) as F
	GROUP BY
	Month
	
	SELECT 
	dbo.ICE_GetMonthName(T1.Month) as [Mnth], 
	T1.NumberSection AS Renewal_Actual, 
	T2.NumberSection + T1.NumberSection AS Renewal_Potential,
	SUBSTRING(CONVERT(varchar(20), ROUND(T1.NumberSection / (T2.NumberSection + T1.NumberSection) * 100, 2)),1,5) + '%' AS Renew_Percent,
	T3.NumberSection AS Revenue_Actual,
	T4.NumberSection AS Revenue_Potential,
	SUBSTRING(CONVERT(varchar(20), ROUND(T3.NumberSection / T4.NumberSection * 100, 2)),1,5) + '%' AS Revenue_Percent
	FROM #NumberOfRenewals T1
	JOIN #NumberForRenewal T2 ON T1.Month = T2.Month
	JOIN #EarnedFromRenewals T3 ON T2.Month = T3.Month
	JOIN #MaxEarnedFromRenewals T4 ON T3.Month = T4.Month
	ORDER BY T1.Month	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalNumber]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalNumber]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_RenewalNumber]
	TO [davor.dumeljic]
GO
