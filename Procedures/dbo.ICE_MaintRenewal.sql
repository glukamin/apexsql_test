SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ICE_MaintRenewal
(
	@DateBegin datetime,
    @DateEnd datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;

	CREATE TABLE #NumberOfRenewals (Month varchar(20), NumberSection float)
	INSERT INTO #NumberOfRenewals 

	SELECT Month = dbo.ICE_GetMonthName(T.Month), T.Total 
	FROM
	( 
		Select Top 100 percent 
		Total = Count( * ),
		Month = Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
		FROM 
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID 
		where 
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd 
		Group by 
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
		order by 
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
	) AS T

	CREATE TABLE #NumberForRenewal (Month varchar(20), NumberSection float)	
	INSERT INTO #NumberForRenewal 

	Select Month = dbo.ICE_GetMonthName(P.Month), P.Total
	from
	(
		SELECT TOP 100 PERCENT 
		Month = Year(ICE_Order_Details.Expiry_Date) * 100 + Month(ICE_Order_Details.Expiry_Date), 
		Total = Count(*)		
		FROM ICE_Order_Details 
		WHERE 
			ICE_Order_Details.Expiry_Date >= @DateBegin and 
			ICE_Order_Details.Expiry_Date <= @DateEnd
		GROUP BY 
			Year(ICE_Order_Details.Expiry_Date) * 100 + Month(ICE_Order_Details.Expiry_Date) 
		ORDER BY
			Year(ICE_Order_Details.Expiry_Date) * 100 + Month(ICE_Order_Details.Expiry_Date) 			
    ) AS P
	
	CREATE TABLE #EarnedFromRenewals (Month varchar(20), NumberSection float)
	INSERT INTO #EarnedFromRenewals	
	SELECT Month = dbo.ICE_GetMonthName(Z.Month), Z.Total	
	FROM
	(
		SELECT TOP 100 PERCENT 
		Month = Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date),
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))
		FROM ICE_Orders 
		INNER JOIN ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
		WHERE
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
		ICE_Orders.Order_Date >= @DateBegin and
		ICE_Orders.Order_Date <= @DateEnd
		GROUP BY
			Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
		ORDER BY
			Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
	) AS Z

	CREATE TABLE #MaxEarnedFromRenewals (Month varchar(20), NumberSection float)
	INSERT INTO #MaxEarnedFromRenewals
	SELECT Month = dbo.ICE_GetMonthName(F.Month), Sum(F.Price) 
	FROM 
	( 
		SELECT TOP 100 PERCENT
		Price = dbo.ICE_GetLicensePrice(Product_ID, License_Type_ID, 1, Qty), 
		Month = Year(ICE_Order_Details.Expiry_Date) * 100 + Month(ICE_Order_Details.Expiry_Date)
		FROM ICE_Order_Details 
		WHERE 
		ICE_Order_Details.Expiry_Date >= @DateBegin and 
		ICE_Order_Details.Expiry_Date <= @DateEnd
		ORDER BY
			Year(ICE_Order_Details.Expiry_Date) * 100 + Month(ICE_Order_Details.Expiry_Date)
	) as F
	GROUP BY 
	Month
	

	SELECT 
	T1.Month, 
	T1.NumberSection AS Number_Of_Renewals, 
	T2.NumberSection AS Total_For_Renewal, 
	T3.NumberSection AS Earned_From_Renewals,
	T4.NumberSection AS Projected_Earned,
	SUBSTRING(CONVERT(varchar(20), ROUND(T1.NumberSection / T2.NumberSection * 100, 2)),1,5) + '%' AS Renewed,
	SUBSTRING(CONVERT(varchar(20), ROUND(T3.NumberSection / T4.NumberSection * 100, 2)),1,5) + '%' AS Revenue
	FROM #NumberOfRenewals T1
	JOIN #NumberForRenewal T2 ON T1.Month = T2.Month
	JOIN #EarnedFromRenewals T3 ON T2.Month = T3.Month
	JOIN #MaxEarnedFromRenewals T4 ON T3.Month = T4.Month
	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_MaintRenewal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_MaintRenewal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_MaintRenewal]
	TO [axreport]
GO
GRANT EXECUTE
	ON [dbo].[ICE_MaintRenewal]
	TO [davor.dumeljic]
GO
