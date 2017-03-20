SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE    [dbo].[ICE_sp_Renewals] 
(
	@ExpirationDateBegin datetime,
    	@ExpirationDateEnd datetime,
	@TrackDateBegin datetime,
	@TrackDateEnd datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;
	
	DECLARE @Renewals float	
	SELECT @Renewals = Count( * )	
	FROM 		
	( 
		SELECT DISTINCT ICE_Orders.Order_ID 
		FROM ICE_Orders 
		INNER JOIN ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
		WHERE 
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
		ICE_Orders.Order_Date >= @TrackDateBegin and
		ICE_Orders.Order_Date <= @TrackDateEnd and 
		ICE_Orders.Cust_ID in 
		(
			SELECT ICE_Orders.Cust_ID 
			FROM ICE_Orders 
			INNER JOIN ICE_Order_Details ON ICE_Orders.Order_ID = ICE_Order_Details.Order_ID
			WHERE 
			DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) >= @ExpirationDateBegin and 
			DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) <= @ExpirationDateEnd and
			ICE_Order_Details.Maintenance_ID > 0	
		)
	) AS Z
				
	DECLARE @ForRenewal float
	SELECT @ForRenewal = Count(ICE_Order_Details.Order_ID)
	FROM ICE_Order_Details 
	INNER JOIN ICE_Orders on ICE_Order_Details.Order_ID = ICE_Orders.Order_ID
	WHERE 
	DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) >= @ExpirationDateBegin and 
	DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) <= @ExpirationDateEnd and
	ICE_Order_Details.Maintenance_ID > 0
			
	DECLARE @TotalEarned float	
	SELECT @TotalEarned = convert(float, Sum(ROUND(ICE_Orders.Total, 0)))
	FROM ICE_Orders
	WHERE
	ICE_Orders.Order_ID IN 
		( 
			SELECT DISTINCT ICE_Orders.Order_ID 
			FROM ICE_Orders 
			INNER JOIN ICE_Extension_Details ON ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
			WHERE 
			ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and
			ICE_Orders.Order_Date >= @TrackDateBegin and
			ICE_Orders.Order_Date <= @TrackDateEnd
		)
	AND
	ICE_Orders.Cust_ID in 
		(
			SELECT ICE_Orders.Cust_ID 
			FROM ICE_Orders 
			INNER JOIN ICE_Order_Details ON ICE_Orders.Order_ID = ICE_Order_Details.Order_ID
			WHERE 
			DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) >= @ExpirationDateBegin and 
			DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) <= @ExpirationDateEnd and
			ICE_Order_Details.Maintenance_ID > 0	
		)
	
	DECLARE @RevenuePotential float
	SELECT @RevenuePotential = Sum(F.Price) 
	FROM 
	( 
		SELECT TOP 100 PERCENT
		Price = dbo.ICE_GetLicensePrice(Product_ID, License_Type_ID, 1, 1)*0.25*Qty 
		FROM ICE_Order_Details 
		INNER JOIN ICE_Orders on ICE_Order_Details.Order_ID = ICE_Orders.Order_ID
		WHERE 
		DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) >= @ExpirationDateBegin and 
		DATEADD(yy, ISNULL(ICE_Order_Details.Maintenance_ID, 0), ICE_Orders.Order_Date) <= @ExpirationDateEnd and 
		ICE_Order_Details.Maintenance_ID > 0	
	) as F
		
	SELECT 	
	@Renewals AS Renewal_Actual, 
	@ForRenewal AS Renewal_Potential,
	Renew_Percent = CASE 
		WHEN @ForRenewal = 0 THEN '-' 
		ELSE SUBSTRING(CONVERT(varchar(20), ROUND(@Renewals / @ForRenewal * 100, 2)),1,5) + '%' 
	END,	
	@TotalEarned AS Revenue_Actual,
	@RevenuePotential AS Revenue_Potential,
	Revenue_Percent	= CASE
		WHEN @RevenuePotential = 0 THEN '-'
		ELSE SUBSTRING(CONVERT(varchar(20), ROUND(@TotalEarned / @RevenuePotential * 100, 2)),1,5) + '%' 
	END	
END

GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Renewals]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Renewals]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Renewals]
	TO [davor.dumeljic]
GO
