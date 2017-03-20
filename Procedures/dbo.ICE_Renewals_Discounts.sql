SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ICE_Renewals_Discounts]
(
    @StartDate datetime,
    @EndDate	 datetime
)
AS 
BEGIN

SELECT P.Order_ID,
O1.Reg_Name AS Company,
CASE (O1.Order_Type_ID)
    when 1 then 'Y'
    else 'N'
END AS IsShareIt,
p.price AS Calculated_Total,
p.tot AS Real_Total, 
(P.price - p.tot) AS Discount1
FROM ICE_Orders O1
INNER JOIN
(
    SELECT ied.Order_ID, sum(ied.total) AS tot, sum(ied.Price*ied.Qty) AS price
    FROM ICE_Orders O
    INNER JOIN dbo.ICE_Extension_Details ied on O.Order_ID = ied.Order_ID
    WHERE 
    O.Order_Date BETWEEN @StartDate AND @EndDate
    AND O.Reseller_ID is null
    AND O.Order_Status_ID in (0,1,2,4)
    GROUP BY ied.Order_ID
) P on O1.Order_ID = P.Order_ID
INNER JOIN ICE_Customers C on O1.Cust_ID = c.Cust_ID

END
GO
