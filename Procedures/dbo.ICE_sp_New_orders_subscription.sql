SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_New_orders_subscription]
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
SET @DateEnd = DATEADD(day,1, @DateEnd );
	SELECT 'All Product' AS Product_Name,
	count(case when iod.Maintenance_ID = 1 then iod.Maintenance_ID  end ) AS '1 year subscription', 
	count(case when iod.Maintenance_ID = 2 then iod.Maintenance_ID  end ) AS '2 years subscription', 
	count(case when iod.Maintenance_ID = 3 then iod.Maintenance_ID  end ) AS '3 years subscription'
	FROM dbo.ICE_Order_Details iod
	INNER JOIN dbo.ICE_Orders io ON io.Order_ID = iod.Order_ID
	INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = iod.Product_ID
	WHERE io.Order_Date >= @DateStart AND io.Order_Date <= @DateEnd AND io.Order_ID NOT IN (18413, 16014) AND io.Order_Status_ID IN (-2,-1,0,1,2,4)
	UNION ALL
	SELECT ip.Product_Name, 
	count(case when iod.Maintenance_ID = 1 then iod.Maintenance_ID  end ) AS '1 year subscription', 
	count(case when iod.Maintenance_ID = 2 then iod.Maintenance_ID  end ) AS '2 years subscription', 
	count(case when iod.Maintenance_ID = 3 then iod.Maintenance_ID  end ) AS '3 years subscription' 
	FROM dbo.ICE_Order_Details iod
	INNER JOIN dbo.ICE_Orders io ON io.Order_ID = iod.Order_ID
	INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = iod.Product_ID
	WHERE io.Order_Date >= @DateStart AND io.Order_Date <= @DateEnd AND io.Order_ID NOT IN (18413, 16014) AND io.Order_Status_ID IN (-2,-1,0,1,2,4)
	GROUP BY ip.Product_Name


END
GO
