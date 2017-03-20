SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Renewals_Per_Customer]

AS 
BEGIN 

WITH firstResult as(
SELECT ic.Cust_ID, (ic.First_Name +' '+ ic.Last_Name) AS Name, MIN(io.Order_Date) AS firstOrder, ISNULL( CONVERT(varchar(10),MAX(iod.Maintenance_ID)), 'N/A') AS SubscriptionLevel FROM dbo.ICE_Customers ic
LEFT JOIN dbo.ICE_Orders io ON ic.Cust_ID = io.Cust_ID
LEFT JOIN dbo.ICE_Order_Details iod ON iod.Order_ID = io.Order_ID
GROUP BY ic.Cust_ID, ic.First_Name, ic.Last_Name
),
secondResult as(
SELECT ic.Cust_ID, count(ic.Cust_ID) AS Renewals, ROUND((CAST(sum(ied.Maintenance_ID) AS float)/CAST(count(ic.Cust_ID) AS float)),0) AS AVGSubs FROM dbo.ICE_Customers ic
INNER JOIN dbo.ICE_Orders io ON ic.Cust_ID = io.Cust_ID
INNER JOIN dbo.ICE_Extension_Details ied ON ied.Order_ID = io.Order_ID
GROUP BY ic.Cust_ID)

SELECT fr.Cust_ID AS CustomerID, 
fr.Name AS Customer, 
ISNULL(sr.Renewals, 0) AS NumberOfRenewalOrders,
ISNULL(CONVERT(varchar(10),sr.AVGSubs), 'N/A') AS AverageSubscriptionPerRenewalOrder,
fr.firstOrder AS FirstOrderDate,
fr.SubscriptionLevel AS SubscriptionLevelOriginalyBought
FROM firstResult fr
LEFT JOIN secondResult sr ON fr.Cust_ID = sr.Cust_ID

END
GO
