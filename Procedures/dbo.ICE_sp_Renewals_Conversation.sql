SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Renewals_Conversation]
( 
@StartDate datetime, 
@EndDate datetime
) 
AS 
BEGIN 
SET @EndDate = DATEADD(day,1, @EndDate );
WITH RenewalsOnTime as(
SELECT ip.Product_ID , count(ip.Product_ID) AS countExpired
FROM dbo.ICE_Extension_Details ied
INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = ied.Product_ID
INNER JOIN dbo.ICE_Orders io ON io.Order_ID = ied.Order_ID
LEFT JOIN dbo.ICE_Order_Details iod ON Extension_Order_Detail_ID = Order_Detail_Id
INNER JOIN dbo.ICE_Orders io2 ON io2.Order_ID = iod.Order_ID
WHERE iod.Expiry_Date >= @StartDate AND iod.Expiry_Date <= @EndDate
AND io.Create_Date >= @StartDate AND io.Create_Date <= @EndDate
GROUP BY ip.Product_ID
),
RealizedRenewals as(
SELECT ip.Product_ID , count(ip.Product_ID) AS countExpired
FROM dbo.ICE_Extension_Details ied
INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = ied.Product_ID
INNER JOIN dbo.ICE_Orders io ON io.Order_ID = ied.Order_ID
LEFT JOIN dbo.ICE_Order_Details iod ON Extension_Order_Detail_ID = Order_Detail_Id
INNER JOIN dbo.ICE_Orders io2 ON io2.Order_ID = iod.Order_ID
WHERE io.Create_Date >= @StartDate AND io.Create_Date <= @EndDate
GROUP BY ip.Product_ID
),
AllData as(
SELECT iod.Product_ID, iod.Expiry_Date AS Expiry FROM dbo.ICE_Order_Details iod
UNION ALL
SELECT ied.Product_ID, ied.Extension_Expiry AS Expiry FROM dbo.ICE_Extension_Details ied
),
PotentialRenewals as(
SELECT ip.Product_ID, count(ip.Product_ID) AS countExpired FROM AllData ad
INNER JOIN dbo.ICE_Products ip ON ad.Product_ID = ip.Product_ID
WHERE ad.Expiry >= @StartDate AND ad.Expiry <= @EndDate
GROUP BY ip.Product_ID
)

SELECT ip.Product_Name, ISNULL(pr.countExpired,0) AS PotentialRenewals,
ISNULL(rr.countExpired,0) AS RealizedRenewals, ISNULL(rot.countExpired,0) AS RenewalsRealizedOnTime
FROM dbo.ICE_Products ip
left JOIN PotentialRenewals pr ON ip.Product_ID = pr.Product_ID
LEFT JOIN RealizedRenewals rr ON ip.Product_ID = rr.Product_ID
LEFT JOIN RenewalsOnTime rot ON ip.Product_ID = rot.Product_ID
WHERE ip.Is_Private = 0

END
GO
