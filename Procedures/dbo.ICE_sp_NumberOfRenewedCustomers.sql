SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_NumberOfRenewedCustomers]
(
    @StartDate datetime,
    @EndDate datetime
)
AS 
BEGIN

SELECT COUNT(*) as [Customers who renewed]
FROM
(
SELECT distinct O.Cust_ID
FROM ICE_Orders O
INNER JOIN ICE_Extension_Details ED on O.Order_ID = ED.Order_ID
WHERE O.Order_Date BETWEEN @StartDate and @EndDate
and O.Order_Status_ID in (0,1,2,4)
GROUP BY O.Cust_ID
) P

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NumberOfRenewedCustomers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NumberOfRenewedCustomers]
	TO [davor.dumeljic]
GO
