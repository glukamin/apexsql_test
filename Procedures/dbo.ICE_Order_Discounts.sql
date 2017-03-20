SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ICE_Order_Discounts]
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
P.Z AS Calculated_Total,
dbo.ICE_GetTotalWithoutRenewal(O1.Order_ID) AS Real_Total, 
(P.Z - dbo.ICE_GetTotalWithoutRenewal(O1.Order_ID)) AS Discount
FROM ICE_Orders O1
INNER JOIN
(
    SELECT OD.Order_ID, SUM(dbo.ICE_GetLicensePriceEnterprice(OD.Product_ID, OD.License_Type_ID, OD.Maintenance_ID,Order_Detail_Id, OD.Qty)*OD.Qty) AS Z
    FROM ICE_Orders O
    INNER JOIN ICE_Order_Details OD on O.Order_ID = OD.Order_ID
    WHERE 
    O.Order_Date BETWEEN @StartDate AND @EndDate
    AND O.Reseller_ID is null
    AND O.Order_Status_ID in (0,1,2,4)
    GROUP BY OD.Order_ID
) P on O1.Order_ID = P.Order_ID
INNER JOIN ICE_Customers C on O1.Cust_ID = c.Cust_ID

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_Order_Discounts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_Order_Discounts]
	TO [davor.dumeljic]
GO
