SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_GetAllCustomers] 

AS 
BEGIN
--Customer Data - Number of orders - number of extension - number subsc. on one year - number subsc. on two year - number subsc. on three year - Total money - In subscrioption
select C.Cust_ID,
C.First_Name,
C.Last_Name,
C.Email,
P.Total_Order_Count,
ISNULL(Z.Extension_Order_Count, 0) as Extension_Order_Count,
ISNULL(Q.ONE_YEAR, 0) as One_Year, 
ISNULL(Q.TWO_YEAR, 0) as Two_Years,
ISNULL(Q.THREE_YEAR, 0) as Three_Years,
P.Total_Revenue,
ZZ.Order_Date as First_Order_Date,
ZZ.Order_Detail_Expiry as Expiry_Date_With_Free_Upgrades,
ZZ.Order_Detail_Expiry_2 as [Expiry_Date]
from ICE_Customers C
inner join
(
      select
      O.Cust_ID,
      Count(*) as Total_Order_Count,
      sum (o.Total) as Total_Revenue
      from ICE_Orders O
      where O.Order_Status_ID in (0,1,2,4)
      group by O.Cust_ID
) P on C.Cust_ID = P.Cust_ID
left join
(
      select O.Cust_ID,      
        Count(distinct O.Order_ID) as Extension_Order_Count
      from ICE_Orders O
      inner join ICE_Extension_Details ED on O.Order_ID = ED.Order_ID
      where O.Order_Status_ID in (0,1,2,4)
      group by O.Cust_ID
) Z on C.Cust_ID = Z.Cust_ID
left join 
(
    SELECT P.Cust_ID,
    SUM(P.ONE_YR) as ONE_YEAR,
    SUM(P.TWO_YR) as TWO_YEAR,
    SUM(P.THREE_YR) as THREE_YEAR
    FROM
    (
         SELECT
         O.Cust_ID, 
         ED.Maintenance_ID, 
         CASE (ED.Maintenance_ID)
              WHEN 1 THEN COUNT(distinct ED.Maintenance_ID)
              ELSE 0 
              END AS ONE_YR,
         CASE (ED.Maintenance_ID)
              WHEN 2 THEN COUNT(distinct ED.Maintenance_ID)
              ELSE 0 
              END AS TWO_YR,
         CASE (ED.Maintenance_ID)
              WHEN 3 THEN COUNT(distinct ED.Maintenance_ID)
              ELSE 0 
              END AS THREE_YR
         FROM ICE_Orders O
         INNER JOIN ICE_Extension_Details ED on O.Order_ID = ED.Order_ID      
         WHERE O.Order_Status_ID in (0,1,2,4)  
         GROUP BY O.Cust_ID, O.Order_ID,  ED.Maintenance_ID
    ) P
    GROUP BY P.Cust_ID
) Q on C.Cust_ID = Q.Cust_ID
left join
(
    select MAX(P.Order_Detail_Expiry) as Order_Detail_Expiry,
    MAX(P.Order_Detail_Expiry_2) as Order_Detail_Expiry_2,
    MIN(P.Order_Date) as Order_Date,
    P.Cust_ID
    from
    (
         select 
         dbo.ICE_GetOrderDetailExpiry(OD.Order_Detail_Id) as Order_Detail_Expiry, 
         dbo.[ICE_GetOrderDetailExpiryNoFreeUpgrades](OD.Order_Detail_Id) as Order_Detail_Expiry_2,
         O.Cust_ID,
         O.Order_Date
         from ICE_Orders O
         inner join ICE_Order_Details OD on O.Order_ID = OD.Order_ID
         where 
         O.Order_Status_ID in (0,1,2,4)
    ) P
    group by P.Cust_ID    
) ZZ on ZZ.Cust_ID = C.Cust_ID

order by C.Cust_ID
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetAllCustomers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetAllCustomers]
	TO [davor.dumeljic]
GO
